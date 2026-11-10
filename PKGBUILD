# Maintainer: Pantelis Christou <pantelis@kernrift.org>
pkgname=kernrift
pkgver=2.11.0
pkgrel=1
pkgdesc="Self-hosted systems language compiler for kernel and bare-metal development"
arch=('x86_64' 'aarch64')
url="https://kernrift.org"
license=('Apache-2.0')
depends=()
provides=('krc' 'kr')
# Prebuilt binaries in KernRift's own fat-binary format: nothing to strip, and
# no separate debug package makes sense.
options=('!strip' '!debug')

# Immutable, versioned URLs so the checksums below stay valid across releases.
_base="https://github.com/Heniokhos-Systems/KernRift/releases/download/v${pkgver}"
_raw="https://raw.githubusercontent.com/Heniokhos-Systems/KernRift/v${pkgver}"

# std modules are arch-independent (same git tag), so both source arrays list
# them in the same order and share the same std hashes.
_std=(alloc apexrift args color console cstr fb fixedpoint fmt font fw_cfg fw_cfg_mmio gc_init gmc gmc_constants gpu_activate gpu_cp_load gpu_imu_load gpu_mes_load gpu_mes_queue gpu_navi32 gpu_pm4 gpu_portable gpu_queue gpu_rlc_load gzip heap_bump idt io log map math math_float mem memfast mouse net pci pci_core pci_ecam pci_port ps2 ramfb serial sha256 string sys time uart_16550 uart_pl011 vec vga_text widget win32 x86)

source_x86_64=(
    "krc::${_base}/krc-linux-x86_64"
    "kr::${_base}/kr-linux-x86_64"
    "alloc.kr::${_raw}/std/alloc.kr"
    "apexrift.kr::${_raw}/std/apexrift.kr"
    "args.kr::${_raw}/std/args.kr"
    "color.kr::${_raw}/std/color.kr"
    "console.kr::${_raw}/std/console.kr"
    "cstr.kr::${_raw}/std/cstr.kr"
    "fb.kr::${_raw}/std/fb.kr"
    "fixedpoint.kr::${_raw}/std/fixedpoint.kr"
    "fmt.kr::${_raw}/std/fmt.kr"
    "font.kr::${_raw}/std/font.kr"
    "fw_cfg.kr::${_raw}/std/fw_cfg.kr"
    "fw_cfg_mmio.kr::${_raw}/std/fw_cfg_mmio.kr"
    "gc_init.kr::${_raw}/std/gc_init.kr"
    "gmc.kr::${_raw}/std/gmc.kr"
    "gmc_constants.kr::${_raw}/std/gmc_constants.kr"
    "gpu_activate.kr::${_raw}/std/gpu_activate.kr"
    "gpu_cp_load.kr::${_raw}/std/gpu_cp_load.kr"
    "gpu_imu_load.kr::${_raw}/std/gpu_imu_load.kr"
    "gpu_mes_load.kr::${_raw}/std/gpu_mes_load.kr"
    "gpu_mes_queue.kr::${_raw}/std/gpu_mes_queue.kr"
    "gpu_navi32.kr::${_raw}/std/gpu_navi32.kr"
    "gpu_pm4.kr::${_raw}/std/gpu_pm4.kr"
    "gpu_portable.kr::${_raw}/std/gpu_portable.kr"
    "gpu_queue.kr::${_raw}/std/gpu_queue.kr"
    "gpu_rlc_load.kr::${_raw}/std/gpu_rlc_load.kr"
    "gzip.kr::${_raw}/std/gzip.kr"
    "heap_bump.kr::${_raw}/std/heap_bump.kr"
    "idt.kr::${_raw}/std/idt.kr"
    "io.kr::${_raw}/std/io.kr"
    "log.kr::${_raw}/std/log.kr"
    "map.kr::${_raw}/std/map.kr"
    "math.kr::${_raw}/std/math.kr"
    "math_float.kr::${_raw}/std/math_float.kr"
    "mem.kr::${_raw}/std/mem.kr"
    "memfast.kr::${_raw}/std/memfast.kr"
    "mouse.kr::${_raw}/std/mouse.kr"
    "net.kr::${_raw}/std/net.kr"
    "pci.kr::${_raw}/std/pci.kr"
    "pci_core.kr::${_raw}/std/pci_core.kr"
    "pci_ecam.kr::${_raw}/std/pci_ecam.kr"
    "pci_port.kr::${_raw}/std/pci_port.kr"
    "ps2.kr::${_raw}/std/ps2.kr"
    "ramfb.kr::${_raw}/std/ramfb.kr"
    "serial.kr::${_raw}/std/serial.kr"
    "sha256.kr::${_raw}/std/sha256.kr"
    "string.kr::${_raw}/std/string.kr"
    "sys.kr::${_raw}/std/sys.kr"
    "time.kr::${_raw}/std/time.kr"
    "uart_16550.kr::${_raw}/std/uart_16550.kr"
    "uart_pl011.kr::${_raw}/std/uart_pl011.kr"
    "vec.kr::${_raw}/std/vec.kr"
    "vga_text.kr::${_raw}/std/vga_text.kr"
    "widget.kr::${_raw}/std/widget.kr"
    "win32.kr::${_raw}/std/win32.kr"
    "x86.kr::${_raw}/std/x86.kr"
    "LICENSE::${_raw}/LICENSE"
)

source_aarch64=(
    "krc::${_base}/krc-linux-arm64"
    "kr::${_base}/kr-linux-arm64"
    "alloc.kr::${_raw}/std/alloc.kr"
    "apexrift.kr::${_raw}/std/apexrift.kr"
    "args.kr::${_raw}/std/args.kr"
    "color.kr::${_raw}/std/color.kr"
    "console.kr::${_raw}/std/console.kr"
    "cstr.kr::${_raw}/std/cstr.kr"
    "fb.kr::${_raw}/std/fb.kr"
    "fixedpoint.kr::${_raw}/std/fixedpoint.kr"
    "fmt.kr::${_raw}/std/fmt.kr"
    "font.kr::${_raw}/std/font.kr"
    "fw_cfg.kr::${_raw}/std/fw_cfg.kr"
    "fw_cfg_mmio.kr::${_raw}/std/fw_cfg_mmio.kr"
    "gc_init.kr::${_raw}/std/gc_init.kr"
    "gmc.kr::${_raw}/std/gmc.kr"
    "gmc_constants.kr::${_raw}/std/gmc_constants.kr"
    "gpu_activate.kr::${_raw}/std/gpu_activate.kr"
    "gpu_cp_load.kr::${_raw}/std/gpu_cp_load.kr"
    "gpu_imu_load.kr::${_raw}/std/gpu_imu_load.kr"
    "gpu_mes_load.kr::${_raw}/std/gpu_mes_load.kr"
    "gpu_mes_queue.kr::${_raw}/std/gpu_mes_queue.kr"
    "gpu_navi32.kr::${_raw}/std/gpu_navi32.kr"
    "gpu_pm4.kr::${_raw}/std/gpu_pm4.kr"
    "gpu_portable.kr::${_raw}/std/gpu_portable.kr"
    "gpu_queue.kr::${_raw}/std/gpu_queue.kr"
    "gpu_rlc_load.kr::${_raw}/std/gpu_rlc_load.kr"
    "gzip.kr::${_raw}/std/gzip.kr"
    "heap_bump.kr::${_raw}/std/heap_bump.kr"
    "idt.kr::${_raw}/std/idt.kr"
    "io.kr::${_raw}/std/io.kr"
    "log.kr::${_raw}/std/log.kr"
    "map.kr::${_raw}/std/map.kr"
    "math.kr::${_raw}/std/math.kr"
    "math_float.kr::${_raw}/std/math_float.kr"
    "mem.kr::${_raw}/std/mem.kr"
    "memfast.kr::${_raw}/std/memfast.kr"
    "mouse.kr::${_raw}/std/mouse.kr"
    "net.kr::${_raw}/std/net.kr"
    "pci.kr::${_raw}/std/pci.kr"
    "pci_core.kr::${_raw}/std/pci_core.kr"
    "pci_ecam.kr::${_raw}/std/pci_ecam.kr"
    "pci_port.kr::${_raw}/std/pci_port.kr"
    "ps2.kr::${_raw}/std/ps2.kr"
    "ramfb.kr::${_raw}/std/ramfb.kr"
    "serial.kr::${_raw}/std/serial.kr"
    "sha256.kr::${_raw}/std/sha256.kr"
    "string.kr::${_raw}/std/string.kr"
    "sys.kr::${_raw}/std/sys.kr"
    "time.kr::${_raw}/std/time.kr"
    "uart_16550.kr::${_raw}/std/uart_16550.kr"
    "uart_pl011.kr::${_raw}/std/uart_pl011.kr"
    "vec.kr::${_raw}/std/vec.kr"
    "vga_text.kr::${_raw}/std/vga_text.kr"
    "widget.kr::${_raw}/std/widget.kr"
    "win32.kr::${_raw}/std/win32.kr"
    "x86.kr::${_raw}/std/x86.kr"
    "LICENSE::${_raw}/LICENSE"
)

sha256sums_x86_64=(
    'c745db1d65264f8b71345e209909a8187807d8121485f53e565668fe2156b676'  # krc
    'c22cb18d95782b7c9f053438189879d20d697689d41b332af112d85a22f25bea'  # kr
    '4312b9434db1f461a27690b817a20d1a55c5afe38749269f9c86b67f2a1b7c62'  # alloc
    'ba2bf3011aa2fee53e4acd636fbabb21bd2f56e3c4b7b1a8730c23e17c6d4114'  # apexrift
    'c7289c463957d815ac6fdef97e4cc3f0b698b9bde052189fd403faf17da02c86'  # args
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '253cf63af71e18963ef21d646c042cedea65d3740fa40173ba399305ee9e417b'  # console
    'be90f6a1585bcffe9f1c14742e2aae5847e8d7b6e5e552ea3ab4afcccc1d25d2'  # cstr
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '8b7bb5443799b753461bd8cf86b7e11ed19b907bb332da2f90c63a084dc0f89f'  # fw_cfg
    '35048f052bfc2fe4c20128e36908909155ffa45b2557e2a6cc2726d1c2291242'  # fw_cfg_mmio
    'd6ba054ff7a70801c71379ee2569d96dd5632bc37a02b9ad744e3a709f9a6b76'  # gc_init
    '47bc144839fe577b26e4370ffc19b88772e30a7afbb85bff0160f770f80e78e4'  # gmc
    '3bbf53b60d73eda52f002a6a024ca1c1daec2a4733dc5307b4f908b779f7d69d'  # gmc_constants
    '564bea4b2d90add8ec57aca2da29e72ce06a478d2c48cfa26dc678c8c06ec680'  # gpu_activate
    '4fc8f65e532b78dc3a89366cbbfc10ed7eb93afed5a85aa4ba390d51ef434e6f'  # gpu_cp_load
    '4fbe700784c3ec1e16ff550267d3c5262660fc035da54fd18311ba0a288baf81'  # gpu_imu_load
    '37c148a4e3bdbf9c2e75afea935bb8520ebe582eb5e8c54a5e1ac2224f0492ed'  # gpu_mes_load
    '1a13b234c0c90bb410acd0a9a54f9db5343f10ee3cee0334398dc22f2cf9c8a7'  # gpu_mes_queue
    '74de5ee11875afebba5c742eac03f5170fb0be419094cfe4e00e27e02bad19a3'  # gpu_navi32
    'a0822eb65181fc8bfff1886106b94d1660d92df10e4c7723f8597fe26122e330'  # gpu_pm4
    '3c5495e0841efdadae21536d8972476844f0d8920666ab662c3432067d5f7692'  # gpu_portable
    'bafa779b4f8391d49ca821d87aaa3096d707e294b5a2c634a1da20f0c73aeb64'  # gpu_queue
    'f8f3c20cff49a6cc6d80ce2f71676cc7e2fd8aea6ca95406be0aa1420ace33a5'  # gpu_rlc_load
    '87620314ff401112f41da0ad450827d0cb0c2d88f7ddbe9c67a2367b455e5be9'  # gzip
    '2a0758683e315645079701744a83e6e438de3dd5c6829920d87317404b8a04f7'  # heap_bump
    '00e2ed69834d2f7675977fcbfe7f77751955728d81e58e47cc907e79e16e6391'  # idt
    '574754be2a710936f88dc2d87f27d78585b6a4b30072660db143bdd639be83a7'  # io
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    'fed30c37139e525a631c5dafb7ffd59d477e0d3c75c3e791f651507a3f07ee49'  # math
    'af74d2e782b7b78d3903e322bfa42597fcc3eee787a15abcf36b4ebaf06da100'  # math_float
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    'a360dd66eb1c7b3f0b0755a24e490e8a3ab0b13fb3d6d9b82be0035abcd8dfda'  # mouse
    '71051d184a49c9a9a43b6fe7d0bd4b5d7cd6f2622ceac997aba882e002364c9e'  # net
    '60d36cbbdfd3cf21acfb1416d2d76caa831473f46b85d91689efce9094abd30e'  # pci
    '6e8b3e5db9613330ea8008d53008ead8638dc4db6b765d3800b8b470105efb3a'  # pci_core
    '401fed037f2655a2ed75e3f7fd98380dd170941fda3122695b8b0c8bebf5b0c7'  # pci_ecam
    '9a9468a395ab50fb173fe147fdad2bb082236bc1a85825e9e5f53be7a2f7303e'  # pci_port
    'cdb5fd9fb430fe9efcbde24fc00b058a032ea69013468b1bd14d4ea4bf01834e'  # ps2
    'da8af87334bdd287a6e11e3f4baa45fa6ec5086db3c7aa8dd38c0fb14803dc3a'  # ramfb
    'a3d6de65629b306c61877d923607a9bd0330f2477b9951e0caa000913409010e'  # serial
    '16aff9d58df1d26de5e7afe6ace3bb0eef2cfd6334c49e42b049d8a295dafece'  # sha256
    '82894056976fb5cd7d87db9ca30eb78a6652d77a6b207ca9dfd5044899ea6df4'  # string
    'a0d41fd818fc37ce1f90939910261191c87063900e2ce5f46c723e5502d1b610'  # sys
    '5f33fc2cb067151842bb7b04170a1b1e9589dc015bbf1eefd8bb13ac5396acc7'  # time
    '89a1c073185eda697c35ab9cb1cd8343f69d1c31e07f9675ae58e1b85fb7a0a4'  # uart_16550
    '9846e49958bbbe5bc8e432e54ba6ab29b26fbed0cfe984e51a5bc140178bf9ca'  # uart_pl011
    '8285dda5eaaea2f8cb347a72a37e240fcc4b3480e8926d0f49d8978e55cbbc55'  # vec
    '73bd94cfbbfc12774205de67eac86bf528d69e3a89d1e1ad9f49bb7dbb62f85c'  # vga_text
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    '9d9d0af5232ace00fea66b02d36aa355ab8bc2059f902b005fbe690d23d07cc9'  # win32
    'fc68581b85e2c50d5e33ff311629fca84f9100a64092bde78b7aa31fa5bbd1d9'  # x86
    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'  # LICENSE
)

sha256sums_aarch64=(
    '455f4f04fefd023368135038bf871684d4f74bf8c97430e26335f4bd34c87d6e'  # krc
    'be44a6ff5c5f2cda44f0b8112936673e7a889e37838bea7041592f0558e24961'  # kr
    '4312b9434db1f461a27690b817a20d1a55c5afe38749269f9c86b67f2a1b7c62'  # alloc
    'ba2bf3011aa2fee53e4acd636fbabb21bd2f56e3c4b7b1a8730c23e17c6d4114'  # apexrift
    'c7289c463957d815ac6fdef97e4cc3f0b698b9bde052189fd403faf17da02c86'  # args
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '253cf63af71e18963ef21d646c042cedea65d3740fa40173ba399305ee9e417b'  # console
    'be90f6a1585bcffe9f1c14742e2aae5847e8d7b6e5e552ea3ab4afcccc1d25d2'  # cstr
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '8b7bb5443799b753461bd8cf86b7e11ed19b907bb332da2f90c63a084dc0f89f'  # fw_cfg
    '35048f052bfc2fe4c20128e36908909155ffa45b2557e2a6cc2726d1c2291242'  # fw_cfg_mmio
    'd6ba054ff7a70801c71379ee2569d96dd5632bc37a02b9ad744e3a709f9a6b76'  # gc_init
    '47bc144839fe577b26e4370ffc19b88772e30a7afbb85bff0160f770f80e78e4'  # gmc
    '3bbf53b60d73eda52f002a6a024ca1c1daec2a4733dc5307b4f908b779f7d69d'  # gmc_constants
    '564bea4b2d90add8ec57aca2da29e72ce06a478d2c48cfa26dc678c8c06ec680'  # gpu_activate
    '4fc8f65e532b78dc3a89366cbbfc10ed7eb93afed5a85aa4ba390d51ef434e6f'  # gpu_cp_load
    '4fbe700784c3ec1e16ff550267d3c5262660fc035da54fd18311ba0a288baf81'  # gpu_imu_load
    '37c148a4e3bdbf9c2e75afea935bb8520ebe582eb5e8c54a5e1ac2224f0492ed'  # gpu_mes_load
    '1a13b234c0c90bb410acd0a9a54f9db5343f10ee3cee0334398dc22f2cf9c8a7'  # gpu_mes_queue
    '74de5ee11875afebba5c742eac03f5170fb0be419094cfe4e00e27e02bad19a3'  # gpu_navi32
    'a0822eb65181fc8bfff1886106b94d1660d92df10e4c7723f8597fe26122e330'  # gpu_pm4
    '3c5495e0841efdadae21536d8972476844f0d8920666ab662c3432067d5f7692'  # gpu_portable
    'bafa779b4f8391d49ca821d87aaa3096d707e294b5a2c634a1da20f0c73aeb64'  # gpu_queue
    'f8f3c20cff49a6cc6d80ce2f71676cc7e2fd8aea6ca95406be0aa1420ace33a5'  # gpu_rlc_load
    '87620314ff401112f41da0ad450827d0cb0c2d88f7ddbe9c67a2367b455e5be9'  # gzip
    '2a0758683e315645079701744a83e6e438de3dd5c6829920d87317404b8a04f7'  # heap_bump
    '00e2ed69834d2f7675977fcbfe7f77751955728d81e58e47cc907e79e16e6391'  # idt
    '574754be2a710936f88dc2d87f27d78585b6a4b30072660db143bdd639be83a7'  # io
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    'fed30c37139e525a631c5dafb7ffd59d477e0d3c75c3e791f651507a3f07ee49'  # math
    'af74d2e782b7b78d3903e322bfa42597fcc3eee787a15abcf36b4ebaf06da100'  # math_float
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    'a360dd66eb1c7b3f0b0755a24e490e8a3ab0b13fb3d6d9b82be0035abcd8dfda'  # mouse
    '71051d184a49c9a9a43b6fe7d0bd4b5d7cd6f2622ceac997aba882e002364c9e'  # net
    '60d36cbbdfd3cf21acfb1416d2d76caa831473f46b85d91689efce9094abd30e'  # pci
    '6e8b3e5db9613330ea8008d53008ead8638dc4db6b765d3800b8b470105efb3a'  # pci_core
    '401fed037f2655a2ed75e3f7fd98380dd170941fda3122695b8b0c8bebf5b0c7'  # pci_ecam
    '9a9468a395ab50fb173fe147fdad2bb082236bc1a85825e9e5f53be7a2f7303e'  # pci_port
    'cdb5fd9fb430fe9efcbde24fc00b058a032ea69013468b1bd14d4ea4bf01834e'  # ps2
    'da8af87334bdd287a6e11e3f4baa45fa6ec5086db3c7aa8dd38c0fb14803dc3a'  # ramfb
    'a3d6de65629b306c61877d923607a9bd0330f2477b9951e0caa000913409010e'  # serial
    '16aff9d58df1d26de5e7afe6ace3bb0eef2cfd6334c49e42b049d8a295dafece'  # sha256
    '82894056976fb5cd7d87db9ca30eb78a6652d77a6b207ca9dfd5044899ea6df4'  # string
    'a0d41fd818fc37ce1f90939910261191c87063900e2ce5f46c723e5502d1b610'  # sys
    '5f33fc2cb067151842bb7b04170a1b1e9589dc015bbf1eefd8bb13ac5396acc7'  # time
    '89a1c073185eda697c35ab9cb1cd8343f69d1c31e07f9675ae58e1b85fb7a0a4'  # uart_16550
    '9846e49958bbbe5bc8e432e54ba6ab29b26fbed0cfe984e51a5bc140178bf9ca'  # uart_pl011
    '8285dda5eaaea2f8cb347a72a37e240fcc4b3480e8926d0f49d8978e55cbbc55'  # vec
    '73bd94cfbbfc12774205de67eac86bf528d69e3a89d1e1ad9f49bb7dbb62f85c'  # vga_text
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    '9d9d0af5232ace00fea66b02d36aa355ab8bc2059f902b005fbe690d23d07cc9'  # win32
    'fc68581b85e2c50d5e33ff311629fca84f9100a64092bde78b7aa31fa5bbd1d9'  # x86
    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'  # LICENSE
)

package() {
    install -Dm755 "$srcdir/krc" "$pkgdir/usr/bin/krc"
    install -Dm755 "$srcdir/kr"  "$pkgdir/usr/bin/kr"

    # Standard library. krc searches /usr/share/kernrift/ (an OS prefix path
    # it already looks in), so no wrapper or KR_STDLIB is needed.
    local stddir="$pkgdir/usr/share/kernrift/std"
    install -dm755 "$stddir"
    for mod in "${_std[@]}"; do
        install -Dm644 "$srcdir/${mod}.kr" "$stddir/${mod}.kr"
    done

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
