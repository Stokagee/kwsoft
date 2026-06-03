# Demo pro kwsoft

## Tento repo slouží pro ukázku RF testů a jeho reportování pomocí Allure.
- Testuje se pouze UI
- Hlavní hnací motor je Browser library založený na Playwrightu, ale je možné přidat i jiné knihovny jako je, DataBase, Appium, REST, SOAP, Sikuli, popřípadě vytvořit vlastní knihovny v Py a propojit je pro lepší čitelnost, pro netechnické lidi.

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

## Reportování (Allure)

Výsledky testů se reportují přes **Allure**. Testy běží paralelně přes Pabot na 3 prohlížečích (Chromium / Firefox / Webkit) a každý prohlížeč má v reportu vlastní suite i vlastní trend, takže u selhání je vidět, na kterém prohlížeči test spadl.

- Po každém běhu v CI se report automaticky publikuje na GitHub Pages včetně historie a trendů napříč běhy: **https://stokagee.github.io/kwsoft/**
- Syrové výsledky (JSON) najdeš ve složce `allure-results/`. Report z nich lze vygenerovat i lokálně přes Allure CLI:
```bash
allure serve allure-results
```

## CI / artefakty
- Pipeline `.github/workflows/ci.yml` běží na `push` i `pull_request` do větve `main`: sestaví Docker image, spustí testy paralelně přes Pabot a publikuje Allure report na GitHub Pages.
- Vedle reportu se ukládá i ZIP se syrovými výsledky a artefakty (logy, screenshoty, video, trace) jako GitHub Actions artefakt `robot-framework-results`.

