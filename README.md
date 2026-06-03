# Demo pro kwsoft

## Tento repo slouží pro ukázku RF testů a jeho reportování pomocí Allure.
- Testuje se pouze UI, ale je možné přidat i API testy.
- Hlavní hnací motor je Browser library založený na Playwrightu, ale je možné přidat i jiné knihovny jako je, DB, Appium, REST, SOAP, Sikuli, popřípadě vytvořit vlastní knihovny v Py a propojit je pro lepší čitelnost, pro netechnické lidi.

## Jak spustit testy

### Docker setup
- Pro spuštění testů je potřeba mít nainstalovaný Docker desktop.
- V kořenovém adresáři projektu vytvořte soubor `.env` a přidejte proměnné z .env.example, přizpůsobte je podle potřeby.
- Spusťte následující příkaz pro sestavení a spuštění kontejnerů:
```bash
docker-compose up --build
```
- První spuštění může chvíli trvat, protože se stáhnou potřebné image a nainstalují závislosti, ale následné spuštění bude rychlejší.
- Testy se spustí automaticky a výsledky budou dostupné v adresáři `allure-results`.

### Spuštění testů bez Dockeru
- Ujistěte se, že máte nainstalovaný Python 3.8+ a všechny závislosti uvedené v `requirements.txt`.
- Spusťte následující příkaz pro instalaci závislostí:
```bash
pip install -r requirements.txt
```
- Nezapomenout na rfbrowser init, pro nainstalování potřebných prohlížečů:
```bash
rfbrowser init
```
- Po úspěšném nainstalování závislostí spustíte testy tak, že se přesunete do adresáře `tests` a spustíte následující příkaz:
```bash
robot --outputdir results tests/
```

## Allure report (historie + trendy)

Po každém běhu v CI se ze složky `allure-results/` (syrový JSON z listeneru) vygeneruje HTML Allure report a publikuje na **GitHub Pages** – včetně historie a trendů napříč běhy.

- **URL reportu:** https://stokagee.github.io/kwsoft/
- Report se publikuje z větve `gh-pages`, kterou workflow vytvoří/aktualizuje automaticky.
- Testy běží paralelně přes Pabot na 3 prohlížečích (Chromium / Firefox / Webkit). Každý prohlížeč má díky `--name` v reportu **vlastní suite i vlastní trend**, takže u selhání je hned vidět, kde to spadlo (navíc je u testů štítek `browser:<jméno>`).

### Jednorázové zapnutí GitHub Pages
Po úplně **prvním** běhu, který vytvoří větev `gh-pages`, je potřeba Pages jednou ručně zapnout:

> Settings → Pages → Build and deployment → Source: **Deploy from a branch** → Branch: `gh-pages` / `/ (root)` → Save

Od dalšího běhu se report aktualizuje sám.

### Vygenerování reportu lokálně (volitelné)
Pokud chceš report otevřít i mimo CI, stačí Allure CLI (vyžaduje Javu – proto v Docker image **není**, generování v CI dělá samostatná GitHub Action):
```bash
allure serve allure-results
```

## CI / artefakty
- Pipeline `.github/workflows/ci.yml` běží na `push` i `pull_request` do větve `main`: sestaví Docker image (s GHA cache), spustí testy a publikuje Allure report.
- Pád testu korektně **zčervená pipeline** (`docker compose up --exit-code-from robot-tests`); report i artefakty se ukládají i tak (kroky s `if: always()`).
- Vedle Allure reportu se ukládá i ZIP se syrovými výsledky a artefakty (logy, screenshoty, video, trace) jako GitHub Actions artefakt **`robot-framework-results`**.

