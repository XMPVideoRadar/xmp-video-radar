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
