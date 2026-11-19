-- XMP VIDEO RADAR — Supabase schema (community features)
-- Run in Supabase SQL Editor. Requires Supabase Auth for safe per-user writes.
create extension if not exists pgcrypto;

create table if not exists public.video_ratings (
  id uuid primary key default gen_random_uuid(),
  video_id text not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  rating smallint not null check (rating between 1 and 5),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (video_id, user_id)
);

create table if not exists public.video_comments (
  id uuid primary key default gen_random_uuid(),
  video_id text not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  display_name text not null check (char_length(display_name) between 1 and 24),
  body text not null check (char_length(body) between 1 and 500),
  created_at timestamptz not null default now()
);

create table if not exists public.video_favorites (
  id uuid primary key default gen_random_uuid(),
  video_id text not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (video_id, user_id)
);

create index if not exists video_ratings_video_id_idx on public.video_ratings(video_id);
create index if not exists video_comments_video_id_created_idx on public.video_comments(video_id, created_at desc);
create index if not exists video_favorites_user_id_idx on public.video_favorites(user_id);

alter table public.video_ratings enable row level security;
alter table public.video_comments enable row level security;
alter table public.video_favorites enable row level security;

drop policy if exists "Ratings are publicly readable" on public.video_ratings;
create policy "Ratings are publicly readable" on public.video_ratings for select using (true);
drop policy if exists "Users create their own ratings" on public.video_ratings;
create policy "Users create their own ratings" on public.video_ratings for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users update their own ratings" on public.video_ratings;
create policy "Users update their own ratings" on public.video_ratings for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users delete their own ratings" on public.video_ratings;
create policy "Users delete their own ratings" on public.video_ratings for delete to authenticated using (auth.uid() = user_id);

drop policy if exists "Comments are publicly readable" on public.video_comments;
create policy "Comments are publicly readable" on public.video_comments for select using (true);
drop policy if exists "Authenticated users create comments" on public.video_comments;
create policy "Authenticated users create comments" on public.video_comments for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users delete their own comments" on public.video_comments;
create policy "Users delete their own comments" on public.video_comments for delete to authenticated using (auth.uid() = user_id);

drop policy if exists "Users read their own favorites" on public.video_favorites;
create policy "Users read their own favorites" on public.video_favorites for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users add their own favorites" on public.video_favorites;
create policy "Users add their own favorites" on public.video_favorites for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users remove their own favorites" on public.video_favorites;
create policy "Users remove their own favorites" on public.video_favorites for delete to authenticated using (auth.uid() = user_id);
