# Vortex 2.0.0 — AUR Fix para Arch Linux (`vortex-linux-fix`)

Paquete AUR corregido para **Vortex** (gestor de mods de Nexus Mods), con compatibilidad completa para Linux.

- **Versión:** 2.0.0-4
- **Upstream:** https://github.com/Nexus-Mods/Vortex
- **AUR:** https://aur.archlinux.org/packages/vortex-linux-fix
- **Probado en:** Arch Linux (kernel 7.0.3-arch1-2)

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
No se necesitan scripts externos: todo está integrado como heredoc Python.

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

### Patch 2 — Validador `requiredFiles`: fallback `.exe` → `.x86_64`

**Problema:** Vortex verifica que los archivos declarados en `requiredFiles` existan en disco.
Los plugins declaran `.exe`. En Linux los juegos nativos usan `.x86_64`, y la validación falla.

**Fix:** En Linux, si `stat()` falla para una ruta `.exe`, reintenta con `.x86_64`.

```js
// antes
bluebird.map(requiredFiles, file =>
  fsExtra.stat(path.join(gamePath, file))
).then(()=>{}).catch(err => { if ("ENOENT" === err.code) return bluebird.reject(err) })

// después
bluebird.map(requiredFiles, file =>
  bluebird.resolve(
    "linux" === process.platform
      ? fsExtra.stat(path.join(gamePath, file))
          .catch(() => fsExtra.stat(path.join(gamePath, file.replace(/\.exe$/i, ".x86_64"))))
      : fsExtra.stat(path.join(gamePath, file))
  )
).then(()=>{}).catch(err => { if ("ENOENT" === err.code) return bluebird.reject(err) })
```

| Escenario | Sin patch | Con patch |
|---|---|---|
| Proton/Wine (`.exe` presente) | ✓ | ✓ |
| Nativo Linux (`.x86_64`) | ✗ Game not found | ✓ |

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

## Plugins bundled: binarios nativos Linux

Los plugins de juego declaran ejecutables Windows en `executable()` y `requiredFiles`.
Para juegos con cliente nativo en Linux, se parchean directamente sus archivos.

| Juego | Binario original | Binario Linux | Archivo parchado |
|---|---|---|---|
| Starbound | `win64/starbound.exe` | `linux/starbound` | `game-starbound/index.js` |
| Team Fortress 2 | `tf_win64.exe` | `hl2_linux` | `game-teamfortress2/index.js` |
| RimWorld | `RimWorldWin64.exe` | `RimWorldLinux` | `game-rimworld/index.js` |
| War Thunder | `win64/aces.exe` | `linux64/aces` | `game-warthunder/index.js` |

Starbound (ejemplo):
```js
// antes
const defaultLocation = 'win64/starbound.exe';

// después
const defaultLocation = process.platform === 'linux' ? 'linux/starbound' : 'win64/starbound.exe';
```

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
├── PKGBUILD          ← PKGBUILD con todos los patches inline (Python heredoc)
├── LINUX_PATCHES.md  ← Documentación técnica en inglés
├── README.md         ← Esta documentación en español
├── vortex.desktop    ← Entrada de escritorio
├── vortex.install    ← Hooks post-install
├── vortex.sh         ← Script lanzador
└── install.sh        ← Instalador alternativo
```

---

## Prueba de funcionamiento — 2026-05-15 (pkgrel=4)

Probado en Arch Linux (kernel 7.0.3-arch1-2):

| Característica | Resultado |
|---|---|
| Detección de Cyberpunk 2077 (Proton) | ✓ |
| REDmod detectado correctamente | ✓ (fix backslash paths) |
| Detección de Starbound (nativo Linux) | ✓ |
| Detección de Graveyard Keeper (nativo Linux) | ✓ |
| Localización manual de juegos (browse dialog) | ✓ |
| Sin crash por `epicGamesLauncher` null | ✓ |
| Sin banner de error `gamebryo-plugin-management` | ✓ |
| Sin crash de inicio por winapi-bindings | ✓ |
| Login cuenta Nexus Mods Premium | ✓ |
| Links NXM (descarga con un clic) | ✓ |
| Instalación de mods | ✓ |

---

## Historial de cambios

| pkgrel | Cambios |
|---|---|
| 1 | Build inicial: dependencias, pnpm, dotnet, patches básicos (requiredFiles, StarterInfo, browseGameLocation) |
| 2 | Fix REDmod (95 backslash paths en extensión Cyberpunk 2077); elimina error gamebryo-plugin-management |
| 3 | epicGamesLauncher stub; winapi-bindings Proxy; binarios Linux para Starbound, TF2, RimWorld, War Thunder; filtro de archivos corregido |
| 4 | winapi-bindings: Proxy no-op silencioso en lugar de Proxy que lanza (fix crash de inicio por SetProcessPreferredUILanguages) |

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
- [ ] Binarios Linux: XCom 2, A Hat in Time, Daggerfall Unity
- [ ] PR upstream a Nexus-Mods/Vortex con los fixes de Linux
- [ ] Mecanismo automático de re-parche de extensiones de usuario tras actualización
