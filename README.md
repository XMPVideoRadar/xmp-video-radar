# XMP VIDEO RADAR

Fanouškovský přehled veřejných videí z kanálu [Plej (@plej111)](https://www.youtube.com/@plej111).

## Web
Po zapnutí GitHub Pages na větvi `main` a ve složce `/(root)` je web dostupný na:

https://xmpvideoradar.github.io/xmp-video-radar/

## Funkce
- Načítání nejnovějších videí přes veřejný YouTube RSS feed (zprostředkovaný službou RSS2JSON).
- Automatické obnovení každých 5 minut a ruční obnovení.
- Vyhledávání podle názvu videa.
- Řazení od nejnovějších, nejstarších a podle místního hodnocení.
- Filtrování oblíbených videí.
- Hodnocení 1–5 hvězdičkami a TOP 3 žebříček.
- Komentáře a oblíbená videa uložená v localStorage konkrétního prohlížeče.
- Responzivní rozvržení pro mobily a počítače, přístupnější ovládací prvky a bezpečné vykreslování textů.

## Omezení a další rozvoj
Hodnocení, komentáře a oblíbené položky jsou zatím pouze lokální. Nejsou sdílené mezi návštěvníky ani zařízeními. Pro společnou komunitní databázi je potřeba nakonfigurovat Supabase (projekt, tabulky, Row Level Security a přístupové údaje). Tyto údaje se nesmí vkládat do veřejného repozitáře, pokud jde o tajné klíče.

YouTube RSS běžně poskytuje pouze omezený počet posledních položek, nikoli neomezený archiv. Načítání přes RSS2JSON závisí na dostupnosti této externí služby.

## Soukromí
Stránka neodesílá komentáře ani hodnocení na vlastní server. Ukládá je do místního úložiště prohlížeče. Sdílení webu se spouští až po kliknutí návštěvníka.

Neoficiální fanouškovský projekt. Videa a jejich obsah patří jejich autorovi.


## XMP 5.1 — profil, TOP 10 a efekty
- Upravitelný lokální profil se jménem a osobním pozdravem.
- TOP 10 žebříček podle místního hodnocení.
- Přepínatelné krátké zvukové efekty (ve výchozím stavu vypnuté).
- Animované srdíčkové efekty, třpytky a zachované omezení animací pro uživatele s nastavením `prefers-reduced-motion`.
- Zachováno načítání 20 posledních videí a automatické obnovení po 5 minutách.

## Sdílená databáze (příprava)
Soubor `supabase.sql` připravuje tabulky pro společná hodnocení, komentáře a oblíbená videa s Row Level Security. **Databáze zatím není připojena k webu**: k aktivaci je nutné vytvořit Supabase projekt, spustit SQL v SQL Editoru a doplnit veřejnou Project URL a anon/publishable key spolu s přihlášením uživatelů. Tajný `service_role` klíč se nikdy nesmí vložit do webu ani repozitáře. Do té doby zůstávají interakce lokální v prohlížeči.


## XMP 6.0 — Community Hub a zálohy
- Nová sekce XMP Community Hub s přímým odkazem na Supabase Dashboard a připravený SQL skript.
- Jasně zobrazený stav: komunitní databáze zatím čeká na konfiguraci; hodnocení, komentáře a oblíbené položky zůstávají lokální.
- Export a import osobní zálohy ve formátu JSON (hodnocení, komentáře, oblíbená videa a jméno profilu).
- Import ověřuje formát, velikost a základní strukturu dat a před nahrazením současných dat vyžaduje potvrzení.
- Pro skutečné sdílení mezi návštěvníky je stále nutné doplnit URL a veřejný anon/publishable klíč konkrétního Supabase projektu a zapnout vhodný způsob přihlášení. Samotný Community Hub žádné online účty ani synchronizaci nepředstírá.
