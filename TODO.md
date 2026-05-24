# vortex-linux-fix — Roadmap de mejoras

Estado actual: **1:2.0.1-15**  
Este archivo documenta los bugs conocidos, mejoras pendientes y limitaciones arquitectónicas.
Actualizar al cerrar cada issue.

---

## Prioridad alta — roto o silenciosamente incorrecto

### [DONE] patch-asar.py: fallos silenciosos en patches críticos
**Estado:** resuelto en 1:2.0.1-15  
`patch_asar_file` imprimía `[WARN]` pero no fallaba cuando un patch crítico no aplicaba.
El build terminaba con éxito produciendo un Vortex no funcional.  
**Fix:** `patch_asar_file` acepta parámetro `critical=True`; los patches de renderer.js
lanzan `sys.exit(1)` si no aplican y no son migration patches.

### [DONE] vortex.sh: Wayland
**Estado:** resuelto en 1:2.0.1-15  
Vortex no pasaba flags de Wayland. En sesiones sin XWayland o con pantallas HiDPI en
Wayland el renderizado era incorrecto.  
**Fix:** `ELECTRON_OZONE_PLATFORM_HINT=auto` permite a Electron elegir el backend correcto.

### [DONE] vortex.sh: --download inyectado a cualquier argumento
**Estado:** resuelto en 1:2.0.1-15  
`if [ -n "$1" ]; then exec ... --download "$@"` añadía `--download` a cualquier argumento,
no solo a URLs nxm://. Ahora solo se inyecta si el argumento empieza por `nxm:`.

### [ ] Runtime patches: sin aviso al usuario si el OLD no coincide tras update de extensión
**Estado:** pendiente  
`patch-ext-*.py` aplican el marker como idempotencia, pero si la extensión se actualiza
y el compilado cambia, el script silenciosamente no aplica el patch.  
**Idea:** escribir un archivo `.vortex-linux-fix-status` en `~/.config/Vortex/` con el
resultado de cada patch-ext en cada arranque, para que el usuario pueda ver si algo falló.

---

## Prioridad media — funcionalidad ausente

### [ ] Plugin sorting (LOOT) no disponible
**Estado:** pendiente — esfuerzo alto  
`gamebryo-plugin-management` es un stub que devuelve error en `lootSortAsync`.
Los usuarios de Skyrim/Fallout con muchos mods no pueden ordenar plugins automáticamente.  
`libloot` tiene binarios Linux. Habría que:
1. Compilar `libloot` o usar el binario precompilado
2. Escribir un wrapper Node.js (N-API) que exponga la misma API que el LOOT de Windows
3. Reemplazar el stub por el wrapper real  
**Complejidad:** alta. No acometer sin un caso de uso reportado por usuarios.

### [ ] GOG / Heroic / non-Steam: `browseGameLocation` hardcodea `store:"steam"`
**Estado:** pendiente — prioridad baja  
En Linux solo se asigna `store:"steam"`. Usuarios con juegos GOG nativos no tienen su
tienda identificada correctamente.  
**Impacto real:** bajo — Vortex en Linux es mayoritariamente Steam. Sin casos reportados.

### [ ] NXM URL scheme: verificar integración xdg-open en Wayland
**Estado:** pendiente — necesita prueba real  
`.desktop` tiene `MimeType=x-scheme-handler/nxm` y `vortex.sh` maneja el argumento,
pero no se ha verificado que `xdg-open nxm://...` invoque correctamente el gestor
en entornos Wayland puros (sin `update-desktop-database` ejecutado post-install).  
**Fix potencial:** añadir `update-desktop-database` al `.install` hook `post_install`.

---

## Prioridad baja — fragilidad y deuda técnica

### [ ] Migration patches acumulados en RENDERER_PATCHES
**Estado:** pendiente  
Hay 4 bloques v5→v6 y v6→v7 en `RENDERER_PATCHES`. Con cada cambio de `new` string
se añade otro par. Limpiar cuando se confirme que nadie tiene un asar anterior a v7
instalado (aprox. 6 meses desde 1:2.0.1-9).

### [ ] patch-ext-cp2077.py: nombre de carpeta hardcodeado
**Estado:** pendiente  
`EXT_PATH` apunta a `"Vortex Extension Update - Cyberpunk 2077/index.js"` literal.
Si Nexus cambia el nombre del directorio, el patch no aplica silenciosamente.  
**Fix:** iterar `~/.config/Vortex/plugins/`, buscar `info.json` con `id: "game-cyberpunk2077"`.

### [ ] PKGBUILD: heredocs Python inline demasiado grandes
**Estado:** pendiente — cosmético  
Los heredocs de `prepare()` podrían extraerse a `patch-prepare-gamebryo.py` o similar,
haciéndolos más fáciles de debuggear y verificar con sha256.

### [ ] gamebryo-savegames-src: sin verificación de integridad del .node compilado
**Estado:** pendiente  
El addon se compila en `prepare()`. Si el build falla silenciosamente (ej. `lz4` no
encontrado), el `.node` no existe pero `package()` no falla explícitamente.  
**Fix:** añadir `test -f build/Release/GamebryoSave.node || exit 1` tras `node-gyp build`.

---

## Limitaciones conocidas (no acometer sin upstream support)

| Limitación | Razón |
|---|---|
| LOOT plugin sorting | `libloot` no tiene integración Node.js oficial en Linux |
| REDmod en Linux | REDmod es un binario Windows sin port Linux oficial |
| GOG overlay / achievements | Sin API Linux de GOG para Vortex |
| Vortex auto-update | El updater descarga un `.exe`; no hay mecanismo Linux |
| Mod collections: algunos tipos de pasos | Algunos `IInstallStep` asumen rutas Windows |

---

## Historial de fixes en este archivo

| Versión | Fix |
|---|---|
| 1:2.0.1-15 | patch-asar.py: sys.exit(1) en patches críticos que no aplican |
| 1:2.0.1-15 | vortex.sh: ELECTRON_OZONE_PLATFORM_HINT=auto (Wayland) |
| 1:2.0.1-15 | vortex.sh: --download solo para URLs nxm:// |
