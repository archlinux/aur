# Maintainer: Pantelis Christou <pantelis@kernrift.org>
pkgname=kernrift
pkgver=2.8.31
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
_std=(alloc string io math math_float fmt mem memfast vec map color fb fixedpoint font widget time log net sha256)

source_x86_64=(
    "krc::${_base}/krc-linux-x86_64"
    "kr::${_base}/kr-linux-x86_64"
    "alloc.kr::${_raw}/std/alloc.kr"
    "string.kr::${_raw}/std/string.kr"
    "io.kr::${_raw}/std/io.kr"
    "math.kr::${_raw}/std/math.kr"
    "math_float.kr::${_raw}/std/math_float.kr"
    "fmt.kr::${_raw}/std/fmt.kr"
    "mem.kr::${_raw}/std/mem.kr"
    "memfast.kr::${_raw}/std/memfast.kr"
    "vec.kr::${_raw}/std/vec.kr"
    "map.kr::${_raw}/std/map.kr"
    "color.kr::${_raw}/std/color.kr"
    "fb.kr::${_raw}/std/fb.kr"
    "fixedpoint.kr::${_raw}/std/fixedpoint.kr"
    "font.kr::${_raw}/std/font.kr"
    "widget.kr::${_raw}/std/widget.kr"
    "time.kr::${_raw}/std/time.kr"
    "log.kr::${_raw}/std/log.kr"
    "net.kr::${_raw}/std/net.kr"
    "sha256.kr::${_raw}/std/sha256.kr"
    "LICENSE::${_raw}/LICENSE"
)

source_aarch64=(
    "krc::${_base}/krc-linux-arm64"
    "kr::${_base}/kr-linux-arm64"
    "alloc.kr::${_raw}/std/alloc.kr"
    "string.kr::${_raw}/std/string.kr"
    "io.kr::${_raw}/std/io.kr"
    "math.kr::${_raw}/std/math.kr"
    "math_float.kr::${_raw}/std/math_float.kr"
    "fmt.kr::${_raw}/std/fmt.kr"
    "mem.kr::${_raw}/std/mem.kr"
    "memfast.kr::${_raw}/std/memfast.kr"
    "vec.kr::${_raw}/std/vec.kr"
    "map.kr::${_raw}/std/map.kr"
    "color.kr::${_raw}/std/color.kr"
    "fb.kr::${_raw}/std/fb.kr"
    "fixedpoint.kr::${_raw}/std/fixedpoint.kr"
    "font.kr::${_raw}/std/font.kr"
    "widget.kr::${_raw}/std/widget.kr"
    "time.kr::${_raw}/std/time.kr"
    "log.kr::${_raw}/std/log.kr"
    "net.kr::${_raw}/std/net.kr"
    "sha256.kr::${_raw}/std/sha256.kr"
    "LICENSE::${_raw}/LICENSE"
)

sha256sums_x86_64=(
    '380eaac52c6e7243417e58817eeff22cc1136dd3300e44e62b5933ae78b42e73'  # krc
    '25c5458631b80ecb7d7d45909a50ab87c6fb79f9e6c1dcf2a3382ad3c90e1368'  # kr
    '3cfcfd48dbe7e31e6050621e5f7250054b26773d866712db0ea8563ecb509b85'  # alloc
    '8f14cdb50cd5e66f3a85c70a762cc57daf03fd734089770ef404cf813f10291f'  # string
    'b28a2b6af75010cfeaaff86e27c3eadb3445a365eb6f87120746ba4f24b9f90b'  # io
    '8ead4a408c5887ca90f25d62138c076f247fcba317e5eedeb763bb68c4d551f2'  # math
    '1b55cd489a3b280aa468597790af2b7ca043f439ed80e8ed4934662723dd59a5'  # math_float
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    '7df742f8b4012aafc2b9c15a60e4da6422696cd66f3461666757bce02163c191'  # vec
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    'd82f5b9e4a5e32b7dacde39db70e1b0f6eac29de5a8ad1c5aaaf182549a8502a'  # time
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '810abc52b9c111def5ab3f1d47f0799cba0e3c667351ddc9a385412313789623'  # net
    '16aff9d58df1d26de5e7afe6ace3bb0eef2cfd6334c49e42b049d8a295dafece'  # sha256
    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'  # LICENSE
)

sha256sums_aarch64=(
    '9461d3a926339a822aad1e9ca2411cb592a425fb076321acf66433e5a54fda00'  # krc
    'f0b01566767fe2f5299ffe744a0735fd81fd95af00c4d6d7f0e4b6766c307549'  # kr
    '3cfcfd48dbe7e31e6050621e5f7250054b26773d866712db0ea8563ecb509b85'  # alloc
    '8f14cdb50cd5e66f3a85c70a762cc57daf03fd734089770ef404cf813f10291f'  # string
    'b28a2b6af75010cfeaaff86e27c3eadb3445a365eb6f87120746ba4f24b9f90b'  # io
    '8ead4a408c5887ca90f25d62138c076f247fcba317e5eedeb763bb68c4d551f2'  # math
    '1b55cd489a3b280aa468597790af2b7ca043f439ed80e8ed4934662723dd59a5'  # math_float
    'ec35d7d2943122388b013dbe4a9d146962f6decee1e214ff3d550abee0b250c4'  # fmt
    '3fdbb63d4c8d7c473569159d7652b6cb8b7e411841015f7fa61a33f6b2618737'  # mem
    '8080f2ccd6fa48e928311c4dedbf41e1a9c9ba7e929f359363936f4e16a2ce56'  # memfast
    '7df742f8b4012aafc2b9c15a60e4da6422696cd66f3461666757bce02163c191'  # vec
    '76a2d8353ee5590a2ce1b86efb682ba2efa1ff36d41deda7335b58d3c1502bba'  # map
    '66cf6aba8db43d8e10ce149bdfb6e08b7b6c792679b00b2916ec236e8d02da32'  # color
    '87e39a5bed3d6aab865ad50232e43dd3079162f555d1f181dd20d7e12a544e6c'  # fb
    'db0c4ba19c589d35e3d58654606660f5b7198a4c7f5ca438e8f1a99014941cca'  # fixedpoint
    '0d454ec80d673e73f1fb125d9dddefc7a3561c9b3a1fb13b51b7dbfd2e12ed9e'  # font
    '43781ed32dc543f1f979bdd9085956ec14ec3544ec557ab293884e1ca1091545'  # widget
    'd82f5b9e4a5e32b7dacde39db70e1b0f6eac29de5a8ad1c5aaaf182549a8502a'  # time
    'e1d6a129ce6780634cab6c42ca26f9c19d7ac35d7cd8ba67c29e6c1b5e1637ea'  # log
    '810abc52b9c111def5ab3f1d47f0799cba0e3c667351ddc9a385412313789623'  # net
    '16aff9d58df1d26de5e7afe6ace3bb0eef2cfd6334c49e42b049d8a295dafece'  # sha256
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
