# XMP VIDEO RADAR

Fanouškovský přehled nejnovějších veřejných videí z kanálu [Plej (@plej111)](https://www.youtube.com/@plej111).

## Spuštění
Projekt je statická stránka. Na GitHubu otevři **Settings → Pages**, v části **Build and deployment** vyber **Deploy from a branch**, branch **main**, folder **/(root)** a ulož. Po zveřejnění bude web dostupný na https://xmpvideoradar.github.io/xmp-video-radar/.

## Funkce
- Načítání nejnovějších videí přes veřejný YouTube RSS feed (přes RSS2JSON)
- Automatické obnovení každých 5 minut a ruční obnovení
- Hodnocení 1–5 hvězdiček a komentáře uložené v localStorage prohlížeče

## Důležité omezení
Hodnocení a komentáře jsou zatím pouze v prohlížeči konkrétního návštěvníka. Nejsou sdílené mezi lidmi ani zařízeními. Pro veřejné společné hodnocení a komentáře je potřeba doplnit databázi a bezpečnostní pravidla (např. Supabase). Veřejný YouTube RSS feed běžně poskytuje poslední položky, nikoli neomezený archiv všech videí.

Neoficiální fanouškovský projekt. Videa a jejich obsah patří kanálu Plej.
