# Maintainer: Pantelis Christou <pantelis@kernrift.org>
pkgname=kernrift
pkgver=2.10.0
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
_std=(alloc color console cstr fb fixedpoint fmt font fw_cfg fw_cfg_mmio gzip heap_bump idt io log map math math_float mem memfast mouse net pci ps2 ramfb serial sha256 string time uart_16550 uart_pl011 vec vga_text widget x86)

source_x86_64=(
    "krc::${_base}/krc-linux-x86_64"
    "kr::${_base}/kr-linux-x86_64"
    "alloc.kr::${_raw}/std/alloc.kr"
    "color.kr::${_raw}/std/color.kr"
    "console.kr::${_raw}/std/console.kr"
    "cstr.kr::${_raw}/std/cstr.kr"
    "fb.kr::${_raw}/std/fb.kr"
    "fixedpoint.kr::${_raw}/std/fixedpoint.kr"
    "fmt.kr::${_raw}/std/fmt.kr"
    "font.kr::${_raw}/std/font.kr"
    "fw_cfg.kr::${_raw}/std/fw_cfg.kr"
    "fw_cfg_mmio.kr::${_raw}/std/fw_cfg_mmio.kr"
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
    "ps2.kr::${_raw}/std/ps2.kr"
    "ramfb.kr::${_raw}/std/ramfb.kr"
    "serial.kr::${_raw}/std/serial.kr"
    "sha256.kr::${_raw}/std/sha256.kr"
    "string.kr::${_raw}/std/string.kr"
    "time.kr::${_raw}/std/time.kr"
    "uart_16550.kr::${_raw}/std/uart_16550.kr"
    "uart_pl011.kr::${_raw}/std/uart_pl011.kr"
    "vec.kr::${_raw}/std/vec.kr"
    "vga_text.kr::${_raw}/std/vga_text.kr"
    "widget.kr::${_raw}/std/widget.kr"
    "x86.kr::${_raw}/std/x86.kr"
    "LICENSE::${_raw}/LICENSE"
)

source_aarch64=(
    "krc::${_base}/krc-linux-arm64"
    "kr::${_base}/kr-linux-arm64"
    "alloc.kr::${_raw}/std/alloc.kr"
    "color.kr::${_raw}/std/color.kr"
    "console.kr::${_raw}/std/console.kr"
    "cstr.kr::${_raw}/std/cstr.kr"
    "fb.kr::${_raw}/std/fb.kr"
    "fixedpoint.kr::${_raw}/std/fixedpoint.kr"
    "fmt.kr::${_raw}/std/fmt.kr"
    "font.kr::${_raw}/std/font.kr"
    "fw_cfg.kr::${_raw}/std/fw_cfg.kr"
    "fw_cfg_mmio.kr::${_raw}/std/fw_cfg_mmio.kr"
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
    "ps2.kr::${_raw}/std/ps2.kr"
    "ramfb.kr::${_raw}/std/ramfb.kr"
    "serial.kr::${_raw}/std/serial.kr"
    "sha256.kr::${_raw}/std/sha256.kr"
    "string.kr::${_raw}/std/string.kr"
    "time.kr::${_raw}/std/time.kr"
    "uart_16550.kr::${_raw}/std/uart_16550.kr"
    "uart_pl011.kr::${_raw}/std/uart_pl011.kr"
    "vec.kr::${_raw}/std/vec.kr"
    "vga_text.kr::${_raw}/std/vga_text.kr"
    "widget.kr::${_raw}/std/widget.kr"
    "x86.kr::${_raw}/std/x86.kr"
    "LICENSE::${_raw}/LICENSE"
)

sha256sums_x86_64=(
    '987354c9bfcfbad36d3c433cbdd9b11870de78cb6010b7668a7806e681a6b003'  # krc
    '67a79330f7ce43454f8f7d8094c0b02df5808394aea7d0335240205cb157370f'  # kr
    'f7e549370bfd4f80fc8cb9dfa6404167647be8425a444ee3a1be30fd218ea673'  # alloc
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '253cf63af71e18963ef21d646c042cedea65d3740fa40173ba399305ee9e417b'  # console
    'be90f6a1585bcffe9f1c14742e2aae5847e8d7b6e5e552ea3ab4afcccc1d25d2'  # cstr
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '8b7bb5443799b753461bd8cf86b7e11ed19b907bb332da2f90c63a084dc0f89f'  # fw_cfg
    '35048f052bfc2fe4c20128e36908909155ffa45b2557e2a6cc2726d1c2291242'  # fw_cfg_mmio
    '87620314ff401112f41da0ad450827d0cb0c2d88f7ddbe9c67a2367b455e5be9'  # gzip
    '2a0758683e315645079701744a83e6e438de3dd5c6829920d87317404b8a04f7'  # heap_bump
    '814e0ee0ca93aff8e020af1949f8e244ab00b6390c473e092328700746d3efc3'  # idt
    '574754be2a710936f88dc2d87f27d78585b6a4b30072660db143bdd639be83a7'  # io
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    'fed30c37139e525a631c5dafb7ffd59d477e0d3c75c3e791f651507a3f07ee49'  # math
    'af74d2e782b7b78d3903e322bfa42597fcc3eee787a15abcf36b4ebaf06da100'  # math_float
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    'a5a5d02dbd70f857c8e5327f636b451680691b19c83107f1d50579fafdfc13f0'  # mouse
    'd9497a4131daf91230142e22a2d5add56eaeeaa3552f051291b4a4cae6f19683'  # net
    '7af3dc4ae5640c276c2f9f3dcc95e95a6382e0cf0c6eeefdcffd98b94398e65d'  # pci
    'cde2607d9945b64369353994a7a3b442421f6fe63ab4e989e84e515d37372379'  # ps2
    'da8af87334bdd287a6e11e3f4baa45fa6ec5086db3c7aa8dd38c0fb14803dc3a'  # ramfb
    'a3d6de65629b306c61877d923607a9bd0330f2477b9951e0caa000913409010e'  # serial
    '16aff9d58df1d26de5e7afe6ace3bb0eef2cfd6334c49e42b049d8a295dafece'  # sha256
    '82894056976fb5cd7d87db9ca30eb78a6652d77a6b207ca9dfd5044899ea6df4'  # string
    'd82f5b9e4a5e32b7dacde39db70e1b0f6eac29de5a8ad1c5aaaf182549a8502a'  # time
    '89a1c073185eda697c35ab9cb1cd8343f69d1c31e07f9675ae58e1b85fb7a0a4'  # uart_16550
    '9846e49958bbbe5bc8e432e54ba6ab29b26fbed0cfe984e51a5bc140178bf9ca'  # uart_pl011
    '8285dda5eaaea2f8cb347a72a37e240fcc4b3480e8926d0f49d8978e55cbbc55'  # vec
    'f4544c1ff81a2a3c59522a27072a7b65573f89f1d2f67ee268ab69034bb12505'  # vga_text
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    '87258b63a799c0402f675b3293a4ce9fb063452a571cee1185da11b1680ea47f'  # x86
    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'  # LICENSE
)

sha256sums_aarch64=(
    'd8005c5c8038c63961492f9deb006650c54cf19708473bf59216e28bddcc2100'  # krc
    'd715600aefe61832ea5088a96a8f3e1183bd76041bbd95f9aaec4c3f61677184'  # kr
    'f7e549370bfd4f80fc8cb9dfa6404167647be8425a444ee3a1be30fd218ea673'  # alloc
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '253cf63af71e18963ef21d646c042cedea65d3740fa40173ba399305ee9e417b'  # console
    'be90f6a1585bcffe9f1c14742e2aae5847e8d7b6e5e552ea3ab4afcccc1d25d2'  # cstr
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '8b7bb5443799b753461bd8cf86b7e11ed19b907bb332da2f90c63a084dc0f89f'  # fw_cfg
    '35048f052bfc2fe4c20128e36908909155ffa45b2557e2a6cc2726d1c2291242'  # fw_cfg_mmio
    '87620314ff401112f41da0ad450827d0cb0c2d88f7ddbe9c67a2367b455e5be9'  # gzip
    '2a0758683e315645079701744a83e6e438de3dd5c6829920d87317404b8a04f7'  # heap_bump
    '814e0ee0ca93aff8e020af1949f8e244ab00b6390c473e092328700746d3efc3'  # idt
    '574754be2a710936f88dc2d87f27d78585b6a4b30072660db143bdd639be83a7'  # io
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    'fed30c37139e525a631c5dafb7ffd59d477e0d3c75c3e791f651507a3f07ee49'  # math
    'af74d2e782b7b78d3903e322bfa42597fcc3eee787a15abcf36b4ebaf06da100'  # math_float
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    'a5a5d02dbd70f857c8e5327f636b451680691b19c83107f1d50579fafdfc13f0'  # mouse
    'd9497a4131daf91230142e22a2d5add56eaeeaa3552f051291b4a4cae6f19683'  # net
    '7af3dc4ae5640c276c2f9f3dcc95e95a6382e0cf0c6eeefdcffd98b94398e65d'  # pci
    'cde2607d9945b64369353994a7a3b442421f6fe63ab4e989e84e515d37372379'  # ps2
    'da8af87334bdd287a6e11e3f4baa45fa6ec5086db3c7aa8dd38c0fb14803dc3a'  # ramfb
    'a3d6de65629b306c61877d923607a9bd0330f2477b9951e0caa000913409010e'  # serial
    '16aff9d58df1d26de5e7afe6ace3bb0eef2cfd6334c49e42b049d8a295dafece'  # sha256
    '82894056976fb5cd7d87db9ca30eb78a6652d77a6b207ca9dfd5044899ea6df4'  # string
    'd82f5b9e4a5e32b7dacde39db70e1b0f6eac29de5a8ad1c5aaaf182549a8502a'  # time
    '89a1c073185eda697c35ab9cb1cd8343f69d1c31e07f9675ae58e1b85fb7a0a4'  # uart_16550
    '9846e49958bbbe5bc8e432e54ba6ab29b26fbed0cfe984e51a5bc140178bf9ca'  # uart_pl011
    '8285dda5eaaea2f8cb347a72a37e240fcc4b3480e8926d0f49d8978e55cbbc55'  # vec
    'f4544c1ff81a2a3c59522a27072a7b65573f89f1d2f67ee268ab69034bb12505'  # vga_text
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    '87258b63a799c0402f675b3293a4ce9fb063452a571cee1185da11b1680ea47f'  # x86
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
