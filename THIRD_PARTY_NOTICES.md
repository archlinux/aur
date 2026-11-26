# Third-party notices

Third-party code and assets retain their own license terms. Legio's Apache 2.0 with Commons Clause license does not replace those terms. MIT-licensed adaptations may be included in a differently licensed application, but their copyright and permission notices must be preserved.

## Inter

Legio bundles the unmodified Inter variable fonts, including italics.

- Source: https://github.com/rsms/inter
- Copyright (c) 2016 The Inter Project Authors.
- License: SIL Open Font License 1.1. The full text is in `src/assets/fonts/OFL.txt`, distributed as `licenses/Inter-OFL.txt` in application bundles.

## Lucide

Legio uses the `@lucide/svelte` icon components.

- Source: https://github.com/lucide-icons/lucide
- Copyright (c) 2026 Lucide Icons and Contributors. Icons derived from Feather are Copyright (c) 2013-present Cole Bemis.
- License: ISC, with MIT for the Feather-derived icons. The full notice is in `_meta/licenses/lucide.txt`, distributed as `licenses/lucide.txt` in application bundles.

## Svelte

Frontend runtime: https://github.com/sveltejs/svelte

MIT License

Copyright (c) 2016-2025 [Svelte Contributors](https://github.com/sveltejs/svelte/graphs/contributors)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Tauri API and plugins

Frontend bindings: `@tauri-apps/api`, `@tauri-apps/plugin-dialog`, `@tauri-apps/plugin-process` and `@tauri-apps/plugin-updater`.

Source: https://github.com/tauri-apps/tauri and https://github.com/tauri-apps/plugins-workspace

MIT License

Copyright (c) 2017 - Present Tauri Apps Contributors
Copyright (c) 2019-2022, The Tauri Programme in the Commons Conservancy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Hydra Launcher

The free-host resolution behavior in `src-tauri/src/download_resolver.rs`, `src-tauri/src/gofile.rs`, `src-tauri/src/gofile_probe.js` and `src-tauri/src/gofile_capture.js` is adapted from the Hydra Launcher hoster implementations at commit `a22ec02201e73db8ca2ee214c2b37cd2d6a27374`.

The Buzzheavier resolution in `src-tauri/src/buzzheavier.rs` follows the bzzhr downloader from Hydra Launcher pull request 2699 (head commit `1163b30ebefcb3f3a04fa07154d295a77b573d1c`, not merged into the main branch).

The character folding map in `src-tauri/src/source_matching.rs` is adapted from Hydra's `src/shared/char-map.ts` at the same commit.

Source: https://github.com/hydralauncher/hydra

MIT License

Copyright (c) 2024 Los Broxas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


## r2modmanPlus

The Thunderstore ecosystem schema handling, package catalog sync, install rules and profile behavior in the Rust modules under `src-tauri/src/modding/` are adapted from r2modmanPlus at commit `b09ec5a9deaef85ebae3e9b3040c23cd91fda4e3` of the `develop` branch.

Source: https://github.com/ebkr/r2modmanPlus

MIT License

Copyright (c) 2020 Cade Ayres

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Rquickjs

Embedded GoFile script runtime: https://github.com/DelSkayn/rquickjs

MIT License

Copyright (c) 2020 Mees Delzenne
Copyright (c) 2025 Rquickjs Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## QuickJS-NG

JavaScript engine bundled by Rquickjs: https://github.com/quickjs-ng/quickjs

The MIT License (MIT)

Copyright (c) 2017-2026 Fabrice Bellard
Copyright (c) 2017-2024 Charlie Gordon
Copyright (c) 2023-2026 Ben Noordhuis
Copyright (c) 2023-2026 Saúl Ibarra Corretgé

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## FlexSearch

Source title indexing embeds the upstream FlexSearch distribution from the `0.7.43` package at commit `4c3966709f855c6980c21035cf230b2f9150d065`.

- Source: https://github.com/nextapps-de/flexsearch
- Author and Copyright: Thomas Wilkerling, hosted by Nextapps GmbH.
- License: Apache-2.0. The complete license is in `src-tauri/vendor/flexsearch.LICENSE`, distributed as `licenses/flexsearch.LICENSE` in application bundles.
- The upstream distribution banner says `v0.7.41`; the package metadata at the pinned commit says `0.7.43`. The distribution file is vendored unchanged.
