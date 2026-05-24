# Vortex 2.0.0 — AUR Fix para Arch Linux (`vortex-linux-fix`)

Paquete AUR corregido para **Vortex** (gestor de mods de Nexus Mods), con compatibilidad completa para Linux.

- **Versión:** 1:2.0.1-15
- **Upstream:** https://github.com/Nexus-Mods/Vortex
- **AUR:** https://aur.archlinux.org/packages/vortex-linux-fix
- **Extensión Linux Compatibility:** https://www.nexusmods.com/site/mods/1924
- **Probado en:** Arch Linux (kernel 7.0.8-1-cachyos)

---

## Instalación rápida

```bash
yay -S vortex-linux-fix
```

### Instalación manual

```bash
git clone https://aur.archlinux.org/vortex-linux-fix.git
cd vortex-linux-fix
makepkg -si
```

---

## Problemas corregidos

Todos los parches se aplican automáticamente en `package()` del PKGBUILD.
Los scripts de parcheo están en archivos externos (`patch-asar.py`, `patch-pkg.js`) incluidos como fuentes verificadas.

---

## `app.asar` — parches en `renderer.js` (motor principal de Vortex)

### Patch 1 — Filtro del explorador de archivos: aceptar ejecutables Linux

**Problema:** El diálogo de selección de ejecutable de juego filtraba solo `.exe`.
En Linux no existen `.exe`, por lo que el explorador aparecía vacío.

**Fix:** En Linux el filtro pasa a `["x86_64", "x86", "sh", "*"]`.

```js
// antes
filters:[{name:"Images",...},{name:"Executables",extensions:["exe"]}]

// después
filters:[{name:"Images",...},{name:"Executables",extensions:"linux"===process.platform?["x86_64","x86","sh","*"]:["exe"]}]
```

---

### Patch 2 — `verifyToolDir` + `verifyGamePath`: fallback `.exe` → `.x86_64`

**Problema:** Vortex verifica que los archivos en `requiredFiles` existan en disco en dos funciones distintas:

- `verifyToolDir` — se llama **cada vez que cambia el game mode** (al cambiar de perfil o abrir la pestaña de un juego). Sin este fix, los juegos con binario Linux nativo generan "Failed to set game mode" en cada cambio de pestaña/perfil.
- `verifyGamePath` — se llama al buscar manualmente la carpeta del juego.

Ambas funciones comprueban `.exe`. En Linux los juegos nativos usan `.x86_64`, y la validación falla.

**Fix:** En Linux, si `stat()` falla para una ruta `.exe`, reintenta con `.x86_64` en ambas funciones.

```js
// verifyToolDir — después
bluebird.mapSeries(requiredFiles, fileName =>
  "linux" === process.platform
    ? fsExtra.stat(path.join(testPath, fileName))
             .catch(() => fsExtra.stat(path.join(testPath, fileName.replace(/\.exe$/i, ".x86_64"))))
    : fsExtra.stat(path.join(testPath, fileName))
             .catch(err => bluebird.reject(err))
).then(() => {})
```

| Escenario                     | Sin patch (verifyToolDir)              | Con patch |
| ----------------------------- | -------------------------------------- | --------- |
| Proton/Wine (`.exe` presente) | ✓                                      | ✓         |
| Nativo Linux (`.x86_64`)      | ✗ "Failed to set game mode" al cambiar | ✓         |

---

### Patch 3 — `StarterInfo.initFromGame`: resolución del binario Linux real

**Problema:** Vortex construye la ruta de lanzamiento a partir de `executable()` del plugin
(siempre `.exe`). En Linux el `.exe` no existe y el lanzamiento falla.

**Fix:** IIFE que recorre candidatos reales en Linux antes de hacer fallback.

```js
this.exePath = (() => {
  const r = gameDiscovery.executable || game.executable;
  const f = path.join(gameDiscovery.path, r);
  if ("linux" !== process.platform || !r || !/\.exe$/i.test(r) || fs.existsSync(f)) return f;

  const f86 = path.join(gameDiscovery.path, r.replace(/\.exe$/i, ".x86_64"));
  if (fs.existsSync(f86)) return f86;                             // 1. mismo nombre con .x86_64

  const fSh = path.join(gameDiscovery.path, "linux", "run-client.sh");
  if (fs.existsSync(fSh)) return fSh;                             // 2. linux/run-client.sh

  const fBin = path.join(gameDiscovery.path, "linux", path.basename(r, path.extname(r)));
  if (fs.existsSync(fBin)) return fBin;                          // 3. linux/<nombre>

  return f; // fallback
})()
```

---

### Patch 4 — `browseGameLocation`: saltar `identifyStore` en Linux

**Problema:** Al localizar manualmente una carpeta de juego, Vortex llama a
`identifyStore()` (detecta Steam/GOG/Epic). En Linux lanza excepción sin capturar
y el flujo falla aunque la carpeta sea correcta.

**Fix:** En Linux se salta la detección y se resuelve con `store: "steam"` directamente.

```js
// después
.then(corrected =>
  "linux" === process.platform
    ? bluebird.resolve({ corrected, store: "steam" })
    : manualGameStoreSelection(api, corrected)
)
```

---

### Patches 9 y 10 — Detección genérica de versión .NET en Linux

**Problema:** En Linux, Vortex detecta la versión de un juego leyendo los metadatos PE del
ejecutable (`.exe`). Para juegos .NET nativos de Linux (como Stardew Valley), el binario es
un script de bash o un ELF sin versión PE, por lo que `testExecProvider` devuelve false y
`getExecGameVersion` devuelve "0.0.0". El resultado es que el diálogo de colecciones
"Game version mismatch" muestra "Your game version:" vacío, aunque la versión instalada
sea exactamente la requerida.

**Fix:** En Linux, cuando el ejecutable no tiene versión PE, se escanean los archivos
`*.deps.json` de la carpeta del juego (manifiestos de dependencias .NET Core/5+).
En lugar de usar el nombre del archivo `.deps.json` como prefijo de búsqueda (lo que fallaba
cuando había varios `.deps.json` en el directorio, p.ej. `BmFont.deps.json` se leía antes
que `Stardew Valley.deps.json` en orden alfabético devolviendo `BmFont/1.0.0`), el algoritmo
normaliza el nombre del ejecutable (minúsculas, sin espacios/puntos/guiones/subrayados) y
busca la clave de biblioteca que mejor coincida:

- **Score 2** (match exacto): `StardewValley` normalizado = `stardewvalley` == `Stardew Valley` normalizado = `stardewvalley` ✓
- **Score 1** (prefijo): `stardewvalley` es prefijo de `stardewvalleygamedata`
- **Score 0** (sin relación): `bmfont`, `monogame`, etc. → ignorado

Solo se acepta la versión si el score es ≥ 1.

```js
// getExecGameVersion — fallback Linux con matching normalizado (renderer.js)
if ("linux" === process.platform && "0.0.0" === _ver) {
    const _norm = s => s.toLowerCase().replace(/[\s.\-_]/g, "");
    const _en = _norm(path.basename(exePath).replace(/\.[^.]+$/, ""));
    const _fls = fs.readdirSync(discovery.path).filter(f => f.endsWith(".deps.json"));
    let _best = null, _bsc = -1;
    for (const _f of _fls) {
        const _d = JSON.parse(fs.readFileSync(path.join(discovery.path, _f), "utf8"));
        for (const _lib of Object.keys(_d.libraries || {})) {
            const _si = _lib.indexOf("/");
            const _lv = _lib.substring(_si + 1);
            if (!_lv || "0.0.0" === _lv) continue;
            const _ln = _norm(_lib.substring(0, _si));
            const _sc = _ln === _en ? 2 : (_ln.startsWith(_en) || _en.startsWith(_ln)) ? 1 : 0;
            if (_sc > _bsc) { _bsc = _sc; _best = _lv; }
        }
    }
    if (_best && _bsc >= 1) _ver = _best;
}
```

**Alcance:** Funciona para cualquier juego .NET Core/5+ sin necesidad de parche por juego.
Stardew Valley: ejecutable `StardewValley` → `stardewvalley` == clave `Stardew Valley` → versión `1.6.15.24356`.

---

### Patch 5 — `epicGamesLauncher`: stub en Linux para evitar crash por null

**Problema:** `util.epicGamesLauncher` es `undefined` en Linux. Los plugins que lo
usan sin null-check (p.ej. `game-survivingmars`, `game-untitledgoose`) lanzan:
`TypeError: Cannot read properties of undefined (reading 'findByAppId')`.

**Fix:** En Linux se proporciona un objeto stub que rechaza todas las peticiones
con una promesa en lugar de lanzar excepción.

```js
exports.epicGamesLauncher = "linux" === process.platform
  ? {
      findByAppId:  () => Promise.reject(new Error("Epic not available on Linux")),
      isGameInstalled: () => Promise.resolve(false),
      queryPath:    () => Promise.reject(new Error("Epic not available on Linux")),
      getAppById:   () => void 0,
    }
  : EpicGamesLauncher_1.default;
```

---

## `app.asar` — parche en `winapi-bindings/index.js`

**Problema:** En Linux `require('winapi-bindings')` devuelve `{}` (objeto vacío).
Cualquier llamada a `winapi.RegGetValue()` etc. lanza `TypeError: winapi.RegGetValue is not a function`,
que es difícil de depurar.

**Fix:** Reemplazar el `{}` por un `Proxy` que devuelve funciones no-op silenciosas.
Un Proxy que lanza excepciones es inseguro porque algunas propiedades (`SetProcessPreferredUILanguages`)
son accedidas por webpack al cargar el módulo, antes de cualquier try/catch, causando un crash de inicio.

```js
// antes
module.exports = {};

// después
module.exports = new Proxy({}, {
  get: function(t, p) {
    return function() { return undefined; };
  },
});
```

---

### Patch 8 — `appDataPath`: redirigir `Plugins.txt` / `loadorder.txt` al prefijo Proton en Linux

**Problema:** La función `appDataPath()` de la extensión `gamebryo-plugin-management`
determina dónde están `Plugins.txt` y `loadorder.txt`. Usa `%LOCALAPPDATA%` en Windows.
En Linux no existe esa variable, por lo que cae al fallback:
`~/.config/Vortex/../Local/<Game>/` — una ruta incorrecta que no existe.

La ruta correcta en Linux con Proton es:
```
~/.steam/steam/steamapps/compatdata/<APPID>/pfx/drive_c/users/steamuser/AppData/Local/<Game>/
```

Resultado: Vortex no puede leer ni escribir el orden de carga ni la lista de plugins activos.

**Fix:** Script de parche en runtime `patch-ext-gamebryo.py` (ejecutado por `vortex.sh`
en cada arranque). Aplica el mismo patrón que el patch de `mygamesPath`: busca el prefijo
compatdata correcto recorriendo todas las librerías Steam.

```js
// antes
function appDataPath(gameMode) {
    const dataPath = gameSupport.get(gameMode, "appDataPath");
    return process.env.LOCALAPPDATA !== void 0
        ? path.join(process.env.LOCALAPPDATA, dataPath)
        : path.resolve(vortex_api.util.getVortexPath("appData"), "..", "Local", dataPath);
}

// después (Linux)
function appDataPath(gameMode) {
    if (process.platform === 'linux') {
        const APPIDS = { skyrim:72850, skyrimse:489830, ..., fallout4:377160, oblivion:22330 };
        const appId = APPIDS[gameMode];
        if (appId !== undefined) {
            // busca en todas las librerías Steam
            for (const lib of steamLibs) {
                const dp = path.join(lib, 'compatdata', String(appId),
                                     'pfx', 'drive_c', 'users', 'steamuser', 'AppData', 'Local');
                if (fs.existsSync(dp))
                    return path.join(dp, gameSupport.get(gameMode, "appDataPath"));
            }
        }
    }
    // fallback original
}
```

**Juegos cubiertos:** Fallout 3, Fallout NV, Fallout 4, Fallout 4 VR, Skyrim, Skyrim SE,
Skyrim VR, Enderal, Enderal SE, Starfield, Oblivion.

**Nota:** Este parche requiere que la extensión `gamebryo-plugin-management` esté instalada
en Vortex. Se aplica automáticamente en cada arranque si la extensión está presente.

---

### Patch 6 — `mygamesPath`: redirigir rutas INI a prefijo Proton en Linux

**Problema:** La función `mygamesPath()` del plugin `gamebryo-test-settings` resuelve
`getVortexPath("documents")` a `~/Documents` en Linux. Pero Proton almacena los
archivos INI de los juegos Bethesda dentro del prefijo de compatdata del juego, no en
`~/Documents`.

Resultado: Vortex no encuentra ni lee los `.ini` de configuración, el orden de carga,
la lista de DLC ni los archivos de contenido descargado.

**Fix:** En Linux, obtiene el path de instalación del juego desde el estado de Vortex
(`vortex_api.getState().persistent.gameMode.discovered[gameMode].path`) y escanea los
`appmanifest_*.acf` de todas las librerías Steam para encontrar el AppID dinámicamente.
Funciona para cualquier juego Bethesda sin tabla de AppIDs hardcodeada.

```js
// antes
function mygamesPath(gameMode) {
    return path.join(vortex_api.util.getVortexPath("documents"), "My Games",
                     gameSupport.get(gameMode, "mygamesPath"));
}

// después (Linux)
function mygamesPath(gameMode) {
    if (process.platform === 'linux') {
        try {
            const disc = vortex_api.getState().persistent.gameMode.discovered;
            const discPath = disc && disc[gameMode] && disc[gameMode].path;
            if (discPath) {
                // escanea appmanifest_*.acf para encontrar el AppID por install path
                // recorre todas las librerías Steam (libraryfolders.vdf)
                // devuelve Documents/ dentro del prefix Proton si existe
            }
        } catch(_e) {}
    }
    return path.join(vortex_api.util.getVortexPath("documents"), "My Games",
                     gameSupport.get(gameMode, "mygamesPath"));
}
```

**Juegos cubiertos:** Cualquier juego Bethesda gestionado por Proton — sin lista fija.

---

### Patch 7 — `iniFiles` (renderer.js): resolver `mygames` vía prefijo Proton (complemento de Patch 6)

**Problema:** La función `iniFiles()` en `renderer.js` (motor principal de Vortex, no
el plugin) calcula la carpeta `My Games` independientemente de `mygamesPath()`:

```js
// dentro de iniFiles(gameMode, discovery)
const mygames = path.join(getVortexPath("documents"), "My Games");
```

Este código no usa un `gameMode` conocido de antemano — usa `discovery.path` para
saber qué juego está activo. Por eso no puede usar la tabla de AppIDs del Patch 6.

**Fix:** IIFE que deduce el AppID a partir de `discovery.path` escaneando los archivos
`appmanifest_*.acf` de todas las librerías Steam. Cubre automáticamente cualquier juego
Gamebryo gestionado vía Proton, sin lista de AppIDs fija.

```js
const mygames = (() => {
  if ("linux" !== process.platform)
    return path.join(getVortexPath("documents"), "My Games");
  const _fs = require("fs");
  const discPath = discovery?.path;
  if (!discPath) return path.join(getVortexPath("documents"), "My Games");
  const normDisc = path.normalize(discPath);
  // Deduce steamapps desde la ruta de instalación y desde ~/.steam
  const cands = [/*...*/];
  // Para cada librería Steam, lee appmanifest_*.acf y busca el juego
  for (const sd of [...new Set(cands)]) {
    for (const mf of _fs.readdirSync(sd).filter(f => f.startsWith("appmanifest_"))) {
      const mt = _fs.readFileSync(path.join(sd, mf), "utf8");
      const im = mt.match(/"installdir"\s+"([^"]+)"/);
      if (im && path.normalize(path.join(sd, "common", im[1])) === normDisc) {
        const idm = mf.match(/appmanifest_(\d+)\.acf/);
        if (idm) {
          const mg = path.join(sd, "compatdata", idm[1], "pfx",
                               "drive_c", "users", "steamuser", "Documents", "My Games");
          if (_fs.existsSync(mg)) return mg;
        }
      }
    }
  }
  return path.join(getVortexPath("documents"), "My Games"); // fallback
})()
```

**Diferencia con Patch 6:** El Patch 6 fija el plugin `gamebryo-test-settings` (que
tiene acceso al `gameMode` y puede usar una tabla de AppIDs). El Patch 7 fija
`renderer.js` (que tiene acceso a `discovery.path` pero no a un AppID conocido, por
lo que debe escanear los manifiestos). Ambos son necesarios.

---

## Plugins bundled: binarios nativos Linux

Los plugins de juego declaran ejecutables Windows en `executable()` y `requiredFiles`.
Para juegos con cliente nativo en Linux, se parchean directamente sus archivos.

| Juego           | Binario original                                | Binario Linux     | Archivo parchado              |
| --------------- | ----------------------------------------------- | ----------------- | ----------------------------- |
| Starbound       | `win64/starbound.exe`                           | `linux/starbound` | `game-starbound/index.js`     |
| Team Fortress 2 | `tf_win64.exe`                                  | `hl2_linux`       | `game-teamfortress2/index.js` |
| RimWorld        | `RimWorldWin64.exe`                             | `RimWorldLinux`   | `game-rimworld/index.js`      |
| War Thunder     | `win64/aces.exe`                                | `linux64/aces`    | `game-warthunder/index.js`    |
| XCOM 2 (base)   | `Binaries/Win64/XCom2.exe`                      | `bin/XCOM2`       | `game-xcom2/index.js`         |
| XCOM 2 (WOTC)   | `XCom2-WarOfTheChosen/Binaries/Win64/XCom2.exe` | `bin/XCOM2`       | `game-xcom2/index.js`         |

Starbound (ejemplo):

```js
// antes
const defaultLocation = 'win64/starbound.exe';

// después
const defaultLocation = process.platform === 'linux' ? 'linux/starbound' : 'win64/starbound.exe';
```

---

## Plugins bundled: extensiones de archivos Gamebryo compiladas para Linux

**Problema:** `gamebryo-ba2-support` (Fallout 4, archivos BA2) y `gamebryo-bsa-support`
(Skyrim/Fallout 3/NV, archivos BSA) usan módulos nativos (`ba2tk`, `bsatk`).
Sus `package.json` tienen una condición invertida que salta el build en Linux y solo
compila en Windows:

```json
"dist": "node -e \"if(process.platform==='win32')process.exit(1)\" || (pnpm run _build ...)"
```

En Linux `process.platform` no es `win32`, el node sale con código 0 y el `||` cortocircuita.
El resultado: los plugins no se compilan y no aparecen en los bundledPlugins.

**Fix:** En `prepare()` del PKGBUILD, un heredoc Python elimina ese guard de los dos
`package.json`. `ba2tk` y `bsatk` compilan correctamente en Linux (confirmado; `bsatk`
tiene `"os": ["win32", "linux"]` oficial). El `.node` nativo queda incluido en el paquete.

`gamebryo-savegame-management` se compila también para Linux desde 1:2.0.1-14 (ver sección siguiente).

---

## Plugins bundled: `gamebryo-savegame-management` compilado para Linux

**Problema:** La extensión de gestión de partidas guardadas para juegos Gamebryo
(Skyrim, Fallout, Oblivion) depende de `gamebryo-savegame`, un addon nativo C++
(`GamebryoSave.node`). Tres bloqueos simultáneos en Linux:

1. El script `dist` tiene el mismo guard invertido que ba2/bsa (build silenciado en Linux).
2. El script `_native` requiere `liblz4.dll` y `zlib.dll` (solo Windows) — `copy-native.mjs`
   devuelve código 1 si algún argumento no existe.
3. `gamebryo-savegame` es `optionalDependency`: cuando su install script falla (por falta
   de `-llz4 -lz` en `binding.gyp`), pnpm omite el paquete de `node_modules` completamente
   y rolldown no puede resolver el import.

**Análisis del C++:** `string_cast.h` tiene dos implementaciones:
```cpp
#ifdef _WIN32
// toWC() usa MultiByteToWideChar / WideCharToMultiByte
#else
static std::string toWC(const char* s, CodePage, size_t) { return s; }  // no-op
#endif
```
`_wstat()` está en bloque `#ifdef _WIN32` con `else stat()`. El C++ **es 100% compatible con Linux**.

**Fix (tres partes):**

1. Guard + `_native` — el heredoc Python en `prepare()` se extiende a los tres plugins,
   y se reescribe `_native` para solo copiar el `.node`:
   ```python
   pkg['scripts']['_native'] = \
       "node ../copy-native.mjs ./node_modules/gamebryo-savegame/build/Release/GamebryoSave.node"
   ```

2. `binding.gyp` — parche Python añade condición Linux antes del bloque Windows:
   ```
   ['OS!="win"', { "libraries": ["-llz4", "-lz"] }]
   ```

3. Build separado — `node-gamebryo-savegames` se añade como fuente git pinned al commit
   exacto del `pnpm-lock.yaml`. En `prepare()` (después de `pnpm install`):
   - `npm install --ignore-scripts` instala `node-addon-api`, `node-gyp` y `autogypi`
   - `autogypi` genera `auto.gypi` / `auto-top.gypi`
   - `node-gyp configure build` compila con cabeceras Electron (hereda `npm_config_*`)
   - El paquete compilado se instala en `extensions/gamebryo-savegame-management/node_modules/`

**Dependencia runtime:** `lz4` añadido a `depends` (link dinámico contra `liblz4.so`).

**Resultado:** Los usuarios de Skyrim, Fallout y otros juegos Bethesda bajo Proton tienen
el navegador de partidas guardadas y aislamiento por perfil funcionando en Vortex.

---

## Plugins bundled: dependencias inexistentes

**Problema:** `gamebryo-plugin-indexlock` y `gamebryo-archive-check` llaman a
`context.requireExtension("gamebryo-plugin-management")`. La extensión no existe
en el repositorio de Nexus → banner de error en cada inicio de Vortex.

**Fix:** Se eliminan esas llamadas con sed en `package()`.

---

## Extensión Cyberpunk 2077: rutas con backslash (fix en runtime)

**Problema:** La extensión oficial de Cyberpunk 2077 usa `path.join('tools\\redmod\\bin\\redMod.exe')`
y similares — 95 rutas con backslash Windows. En Linux `path.join()` no convierte `\\` a `/`,
por lo que busca archivos literalmente con backslashes en el nombre (no existen).

Resultado: REDmod aparece como "DLC missing" aunque esté instalado.

**Fix:** Se parchea `~/.config/Vortex/plugins/Vortex Extension Update - Cyberpunk 2077/index.js`
directamente con Python (reemplazo de `\\` por `/` en todos los `path.join()` de la extensión).
Este parche se aplica sobre el plugin de usuario, no sobre el PKGBUILD.

```python
# Reemplaza backslashes en todos los path.join() de la extensión
re.sub(r'path_1\.default\.join\(`([^`]*)`\)', fix_path_join, content)
```

---

## Configuración post-instalación

```bash
# Asociar links NXM (descarga con un clic desde Nexus Mods)
xdg-mime default vortex.desktop x-scheme-handler/nxm

# Iniciar Vortex
vortex
```

---

## Archivos del fork

```
vortex-aur-fix/
├── PKGBUILD          ← PKGBUILD principal
├── .SRCINFO          ← Metadatos AUR generados
├── patch-asar.py     ← Patcher de app.asar y bundledPlugins
├── patch-pkg.js      ← Patcher de package.json (prepare + build)
├── vortex.desktop    ← Entrada de escritorio
├── vortex.install    ← Hooks post-install/post-upgrade
├── vortex.sh         ← Script lanzador
├── LINUX_PATCHES.md  ← Documentación técnica en inglés
└── README.md         ← Esta documentación en español
```

---

## Prueba de funcionamiento — 2026-05-18 (1:2.0.1-2)

Probado en Arch Linux (kernel 7.0.8-1-cachyos):

| Característica                                           | Resultado               |
| -------------------------------------------------------- | ----------------------- |
| Detección de Cyberpunk 2077 (Proton)                     | ✓                       |
| REDmod detectado correctamente                           | ✓ (fix backslash paths) |
| Detección de Starbound (nativo Linux)                    | ✓                       |
| Detección de Graveyard Keeper (nativo Linux)             | ✓                       |
| Localización manual de juegos (browse dialog)            | ✓                       |
| Sin crash por `epicGamesLauncher` null                   | ✓                       |
| Sin banner de error `gamebryo-plugin-management`         | ✓                       |
| Sin crash de inicio por winapi-bindings                  | ✓                       |
| Login cuenta Nexus Mods Premium                          | ✓                       |
| Links NXM (descarga con un clic)                         | ✓                       |
| Instalación de mods                                      | ✓                       |
| INIs de Fallout 4 (Proton) — ruta compatdata correcta    | ✓                       |
| INIs de Skyrim SE (Proton) — ruta compatdata correcta    | ✓                       |
| Orden de carga / DLC list / AppData resueltos vía Proton | ✓                       |

---

## Historial de cambios

| pkgrel        | Cambios                                                                                                                                                                                                                                                                                      |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1             | Build inicial: dependencias, pnpm, dotnet, patches básicos (requiredFiles, StarterInfo, browseGameLocation)                                                                                                                                                                                  |
| 2             | Fix REDmod (95 backslash paths en extensión Cyberpunk 2077); elimina error gamebryo-plugin-management                                                                                                                                                                                        |
| 3             | epicGamesLauncher stub; winapi-bindings Proxy; binarios Linux para Starbound, TF2, RimWorld, War Thunder; filtro de archivos corregido                                                                                                                                                       |
| 4             | winapi-bindings: Proxy no-op silencioso en lugar de Proxy que lanza (fix crash de inicio por SetProcessPreferredUILanguages)                                                                                                                                                                 |
| 5–9           | Refactor: scripts externos (`patch-asar.py`, `patch-pkg.js`); `chmod 777→755` en assets + hook post-upgrade; elimina `dotnet-sdk-9.0` de makedepends (~500MB menos); elimina `NO_PARALLEL` (builds paralelas más rápidas); suprime 28 warnings de subdependencias deprecadas                 |
| 10            | Ruta absoluta `$srcdir` en `build()`; dotnetprobe consolidado en `package()`; elimina patch redundante de `game-survivingmars` (cubierto por el stub global de epicGamesLauncher)                                                                                                            |
| 11            | Re-parche automático de la extensión Cyberpunk 2077 en cada arranque: `patch-ext-cp2077.py` corrige 95 rutas backslash Windows en `path.join()`; detección por marker `// vortex-linux-fix`; `python` añadido a `depends`                                                                    |
| 12            | Sistema genérico de re-parche: `vortex.sh` itera sobre `patch-ext-*.py` en `/opt/Vortex/`; añadir soporte para nuevas extensiones no requiere modificar `vortex.sh`                                                                                                                          |
| **2.0.1-1**   | Actualización a upstream 2.0.1; corrección de patterns de plugin patches (comillas simples → dobles en bundled plugins); 16/16 patches [OK]                                                                                                                                                  |
| **1:2.0.1-2** | Patch `mygamesPath` en `gamebryo-test-settings`: en Linux busca el prefijo Proton correcto recorriendo todas las librerías Steam en lugar de usar `~/Documents`. Cubre Fallout 3/NV/4/4VR, Skyrim/SE/VR, Enderal/SE, Starfield y Oblivion. Epoch=1 añadido por cambio de esquema de versión. |
| **1:2.0.1-3** | Binario Linux para XCOM 2 y WOTC: `bin/XCOM2` (port Feral) en lugar de `Binaries/Win64/XCom2.exe`. Daggerfall Unity cubierto por patches genéricos (`.exe`→`.x86_64`). A Hat in Time no requiere patch (Proton, `.exe` presente).                                                            |
| **1:2.0.1-4** | Patch 7 — `iniFiles` en renderer.js: complementa el Patch 6 (gamebryo-test-settings) resolviendo `mygames` en el motor central. Usa appmanifest scan para detectar el AppID a partir de `discovery.path`; cubre automáticamente cualquier juego Gamebryo sin lista fija. |
| **1:2.0.1-5** | Hotfix: `})()` → `})();` en el new string del patch de `iniFiles`. El `;` faltante provocaba `SyntaxError` en el renderer de Electron (pantalla negra en Vortex). |
| **1:2.0.1-6** | Patch 8 — `appDataPath` en `gamebryo-plugin-management`: en Linux resuelve `Plugins.txt` y `loadorder.txt` al prefijo Proton en lugar de `~/.config/Local/<game>/`. Script de parche runtime `patch-ext-gamebryo.py`; misma lógica de búsqueda Steam que Patch 6. Reportado por Garecrow. |
| **1:2.0.1-7** | Patches 9 y 10 — Detección genérica de versión de juego en Linux: `testExecProvider` y `getExecGameVersion` buscan `.deps.json` de .NET si el ejecutable no tiene versión PE. Arregla el diálogo "Game version mismatch" vacío en colecciones de Nexus para juegos .NET (Stardew Valley, etc.). Solución genérica — funciona para cualquier juego .NET sin parche por juego. |
| **1:2.0.1-8** | Patches 9 y 10 v6 — Normalización del nombre del ejecutable al buscar en `.deps.json`: minúsculas, sin espacios/puntos/guiones/subrayados, con puntuación (exacto=2, prefijo=1). Arregla falsos positivos cuando hay varios `.deps.json` en el directorio del juego (p.ej. `BmFont.deps.json` devolvía versión errónea antes que `Stardew Valley.deps.json`). Incluye parches de migración v5→v6 para asars ya instalados. |
| **1:2.0.1-9** | Patches 9 y 10 v7 — Fix crítico: `exeVersion.default()` devuelve `undefined` (no lanza excepción) para binarios ELF en Linux. El operador `\|\|"0.0.0"` garantiza que `_ev`/`_ver` nunca quede `undefined`, activando correctamente el fallback a `.deps.json`. Arregla campo "Tu versión del juego:" vacío en el diálogo de incompatibilidad de colecciones. Incluye parches de migración v6→v7 para asars ya instalados. |
| **1:2.0.1-11** | Patch 11 — Generic BepInEx Linux fixer (`patch-ext-bepinex.py`): detecta juegos Unity con BepInEx Windows desplegado sobre binario nativo Linux. Copia `libdoorstop.so` (bundled), corrige rutas backslash en `doorstop_config.ini` y establece `LD_PRELOAD` en `localconfig.vdf`. Genérico — cubre cualquier juego Unity+BepInEx sin parches por juego. |
| **1:2.0.1-13** | `gamebryo-ba2-support` (BA2, Fallout 4) y `gamebryo-bsa-support` (BSA, Skyrim/Fallout 3/NV) compilados nativamente para Linux. Los `package.json` upstream tienen un guard `if(platform==='win32')…exit(1) \|\|` que salta el build en Linux; se elimina en `prepare()` con un heredoc Python. `ba2tk` y `bsatk` compilan en Linux sin modificaciones (`bsatk` tiene soporte Linux oficial). |
| **1:2.0.1-14** | `gamebryo-savegame-management` (navegador de partidas guardadas para Skyrim/Fallout/Oblivion) compilado para Linux. El addon C++ `GamebryoSave.node` es 100% compatible: `toWC`/`_wstat` tienen `#else` Linux. Tres fixes: guard eliminado, `_native` sin DLLs Windows, `binding.gyp` parchado con `-llz4 -lz`. `node-gamebryo-savegames` añadido como source git pinned; compilado con `node-gyp` + cabeceras Electron en `prepare()`. `lz4` añadido a `depends`. |
| **1:2.0.1-15** | Patch 6 (`mygamesPath`) generalizado: elimina tabla `_sids` con 11 AppIDs hardcodeados. Ahora usa `vortex_api.getState().persistent.gameMode.discovered[gameMode].path` + appmanifest scan — el mismo patrón que `iniFiles` (Patch 7) y `appDataPath` (Patch 8). Cubre cualquier juego Bethesda sin necesidad de actualizar el paquete. |

---

## Sesión de optimización — 2026-05-16

Análisis y mejoras aplicadas al paquete en esta sesión (pkgrel=4 → pkgrel=9):

### Qué se analizó

- Comparativa del PKGBUILD local con el publicado en AUR — **idénticos**
- Uso real de cada `makedepend` durante la build
- Tiempos de build con y sin `NO_PARALLEL`
- Permisos del directorio `assets/` tras instalación limpia vs. upgrade

### Cambios aplicados

| Cambio                                        | Motivo                                                                | Impacto                                                               |
| --------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- |
| Extraer heredoc Python a `patch-asar.py`      | Mantenibilidad, sha256 verificable                                    | El PKGBUILD pasó de ~410 a ~120 líneas                                |
| Extraer `node -e` a `patch-pkg.js`            | Reutilización en `prepare()` y `build()`                              | Un solo archivo en lugar de dos bloques inline                        |
| `chmod 777→755` en assets + `post_upgrade()`  | Seguridad; pacman no actualiza permisos de dirs existentes en upgrade | Corregido en instalaciones limpias y upgrades                         |
| Eliminar `dotnet-sdk-9.0` de makedepends      | `dotnetprobe` viene precompilado en el repo upstream                  | ~500 MB menos en builds limpias                                       |
| Eliminar `NO_PARALLEL="1"`                    | Workaround ya no necesario                                            | Build paralela de módulos nativos; ~15-20 s menos en builds cacheadas |
| `allowedDeprecatedVersions` en `patch-pkg.js` | Subdependencias deprecadas que no podemos actualizar                  | 28 warnings de pnpm eliminados                                        |
| `.gitignore`                                  | Evitar subir artefactos de build al AUR                               | Limpieza del repo                                                     |

### Resultados de build

| Build    | Condiciones                           | Tiempo       |
| -------- | ------------------------------------- | ------------ |
| pkgrel=5 | Con `NO_PARALLEL`, clone git completo | 2 min 26 sec |
| pkgrel=8 | Sin `NO_PARALLEL`, clone cacheado     | 1 min 54 sec |

### Descartado

- **Extensión Vortex para los patches**: técnicamente posible para ~30% de los patches (plugins de juego), pero los patches del core (`renderer.js`, `winapi-bindings`) requieren modificar el asar igualmente. Más trabajo del que ahorra.
- **Repos de CachyOS en la instalación actual**: riesgo de conflictos con paquetes de Omarchy. El kernel `linux-cachyos` sí es instalable de forma independiente.
- Eliminar `npm` de makedepends: confirmado necesario (electron-builder lo invoca para compilar `loot` y otros módulos nativos).

---

## Sesión de análisis y limpieza — 2026-05-17

Revisión completa del código y limpieza aplicada al paquete en esta sesión (pkgrel=9 → pkgrel=10):

### Qué se analizó

- PKGBUILD: rutas, orden de operaciones, duplicidades
- `patch-asar.py`: lógica del formato asar, orden de parcheado, idempotencia del marker, balance de paréntesis en todos los patches de `renderer.js`
- `patch-pkg.js`: overrides y allowedDeprecatedVersions
- `vortex.sh`, `vortex.desktop`, `vortex.install`: flags, MimeType, hooks post-install

### Cambios aplicados

| Cambio                                                           | Motivo                                                                                    | Impacto                                                            |
| ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `rm -rf ../../dist/linux-unpacked` → ruta absoluta con `$srcdir` | Ruta relativa asumía cwd=`src/main/`; falla silenciosamente si cambia el layout           | Eliminado riesgo de limpieza incorrecta del directorio             |
| Eliminar `cp/chmod` de dotnetprobe en `build()`                  | Duplicado con `install -Dm755` en `package()`; un solo punto de instalación               | Menos código, permisos gestionados por un único `install -Dm755`   |
| Eliminar patch `game-survivingmars` de `PLUGIN_PATCHES`          | Redundante: el stub global de `epicGamesLauncher` en renderer Patch 5 cubre el null-check | Menos código a mantener y verificar en cada actualización upstream |

### Hallazgos sin acción requerida

- **Campo `_pls` en reconstrucción asar**: se escribe `4+n` en lugar de `4` (valor fijo del pickle de Chromium). Inofensivo — Electron no lee ese campo tras el parse inicial.
- **`>>` en pnpm-workspace.yaml**: frágil si se repite en el mismo directorio, pero en el flujo de makepkg el directorio es siempre fresco.
- **`update-mime-database` en `vortex.install`**: innecesario para URL scheme handlers (los gestiona `update-desktop-database`), pero inofensivo.

---

## Sesión — 2026-05-18 (pkgrel=1 → pkgrel=2, epoch=1)

### Problema reportado

Juegos Bethesda (Fallout 4, Skyrim, etc.) no encontraban sus archivos INI, orden de carga,
lista de DLC ni archivos de contenido descargado. Vortex buscaba en `~/Documents/My Games/`
pero Proton almacena esos archivos dentro del prefijo de compatdata:

```
~/.steam/steam/steamapps/compatdata/<APPID>/pfx/drive_c/users/steamuser/Documents/My Games/
```

### Fix aplicado

Nuevo patch en `gamebryo-test-settings/index.cjs` — función `mygamesPath()`:

- Detecta si es Linux y si el juego es uno de los 11 Bethesda soportados
- Lee `libraryfolders.vdf` para cubrir librerías Steam externas
- Busca el prefijo compatdata en cada librería
- Usa la ruta Proton si existe; cae a `~/Documents` si no

### Juegos cubiertos por el fix

Fallout 3, Fallout NV, Fallout 4, Fallout 4 VR, Skyrim, Skyrim SE, Skyrim VR,
Enderal, Enderal SE, Starfield, Oblivion.

---

## Hoja de ruta

- [x] Build funcional en Arch Linux
- [x] Patch `requiredFiles`: `.exe` → `.x86_64` fallback
- [x] Patch `initFromGame`: lanzamiento nativo Linux
- [x] Patch `browseGameLocation`: fix localización manual
- [x] Publicado en AUR como `vortex-linux-fix`
- [x] Fix REDmod DLC missing (extensión Cyberpunk 2077)
- [x] Fix `gamebryo-plugin-management` banner de error
- [x] `epicGamesLauncher` stub en Linux
- [x] `winapi-bindings` Proxy con errores claros
- [x] Binarios Linux: Starbound, TF2, RimWorld, War Thunder
- [x] Scripts de parche extraídos a archivos externos verificados por sha256
- [x] Permisos de assets corregidos (777→755) y reforzados en post-upgrade
- [x] `dotnet-sdk-9.0` eliminado de makedepends (prebuilt en repo)
- [x] Build paralela de módulos nativos (NO_PARALLEL eliminado)
- [x] Rutas INI/AppData de juegos Bethesda vía prefijo Proton (Fallout 4, Skyrim, etc.)
- [x] Binarios Linux: XCOM 2 y WOTC (`bin/XCOM2`, port Feral)
- [x] Daggerfall Unity: cubierto por patches genéricos (`.exe` → `.x86_64`)
- [x] A Hat in Time: sin binario Linux nativo, funciona vía Proton sin patch
- [x] `Plugins.txt` / `loadorder.txt` de juegos Bethesda vía prefijo Proton (`gamebryo-plugin-management`)
- [x] Detección genérica de versión para juegos .NET en Linux (Stardew Valley y similares): `deps.json` fallback
- [x] `gamebryo-ba2-support` y `gamebryo-bsa-support` compilados nativamente para Linux (ba2tk, bsatk)
- [ ] PR upstream a Nexus-Mods/Vortex con los fixes de Linux
- [ ] Mecanismo automático de re-parche de extensiones de usuario tras actualización
- [ ] `gamebryo-savegame-management`: portación C++ (`_wstat`, wide-char Win32)
