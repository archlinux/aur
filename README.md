# Cornelsen Offline Lernen

Cornelsen Offline Lernen ist eine Electron App, die es ermöglicht, digitale Lerninhalte von Cornelsen auch ohne Internetverbindung zu nutzen. Die App bietet eine benutzerfreundliche Oberfläche und unterstützt verschiedene Lernmaterialien, die von Cornelsen bereitgestellt werden.

Die aktuelle Version der App ist 2026.21.1 (Electron 44, Stand 15.11.2026).

## Paket

- `pkgver` ist die Electron-Version, mit der Cornelsen die App ausliefert; das Paket nutzt das passende `electronNN` aus extra.
- Cornelsen lädt jede neue Version unter derselben Adresse hoch. Schlägt die Prüfsumme fehl, gibt es eine neue Version: Electron-Version prüfen, `pkgver`/`depends` anpassen, `updpkgsums`.
- `prepare()` patcht die App, damit ein 401 der Kompatibilitätsprüfung die Synchronisierung nicht blockiert. Die minifizierten RxJS-Namen werden beim Bauen gesucht; `CORNELSEN_PATCH_STRICT=1` lässt den Bau fehlschlagen, wenn der Patch nicht greift.
