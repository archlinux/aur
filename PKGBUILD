# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=intellishell-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Smart bookmark manager for shells"
arch=("$CARCH" "aarch64")
url="https://github.com/lasantosr/intelli-shell"
license=("Apache-2.0")
provides=("intellishell")
conflicts=() # NOTE update if intellishell package is created
depends=("gcc-libs" "zlib")
changelog="CHANGELOG"
install="intelli-shell.install"
source=("LICENSE::https://raw.githubusercontent.com/lasantosr/intelli-shell/refs/tags/v${pkgver}/LICENSE",
        "README.md::https://raw.githubusercontent.com/lasantosr/intelli-shell/refs/tags/v${pkgver}/README.md")
source_x86_64=("https://github.com/lasantosr/intelli-shell/releases/download/v${pkgver}/intelli-shell-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/lasantosr/intelli-shell/releases/download/v${pkgver}/intelli-shell-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('304aa1063d2502e840a2d85c59b8c3860bcf0173d53f279e9b0492ea5a34d312'
            'f47673265b6c975d5ffb8663df55fdd9228ad08b3cc947bd29e63ef3f7449307')
sha256sums_x86_64=('550fc24db0dcc61118b3dba44b3619306763684a475bb2be6b8436943a163479')
sha256sums_aarch64=('772cec6fdc58846be2d5a5eb7acbd978a2a06e43f22af88ec58af8e093151768')
sha512sums=('42073f5052cc154642821ca7b36a85303e8f0c933cea928aa19d622838d5c0f40a8e1612569dc4f12919cee94e878eb02c72d81df65970c0ad443b319c473aaa'
            '58fd59d74dc0820f34646825063b22cc62d9164718a99cb5572e7c51d2cc31999123e0e8132e43e2ea0eedf633d310d2a5aa5907c06acaa0bdfaf5f5cbe1d9ab')
sha512sums_x86_64=('ef3bf481aa6b37079b750f554ccd24737e6353bd177db7093b9cb6c29b5d4af42a68eea205adc6f5bbe55591336d1c18c6b06ff934967d8801a96d3ec9e7ce25')
sha512sums_aarch64=('7db57776453047ce5b723e4cc28ca8f3f1713db83c1568e9685b79a02e2c3245c081aaeb9f5b142b96508c55e7add82b398d1f7dc61e51284deb6a8f06904e33')
b2sums=('f6ae98100aa002992f466eddaeeef69d3a745156e7b05f2bb4b005095faed0a0d49116005963c3fd67945bef53c1d8a35daf57e64ab2e882e295c2b35e9836f5'
        'aceffa1aa2389d6e3a9ddc134373ec9d3c0afd4c59dc58c641fde951591b350dcaa400cb358a2d188a8019b51db1be3ad5fa77580d36c21760851735e49f27b9')
b2sums_x86_64=('4e6fb63641b48d07f3738d95eddd52a25d9bcdec13c43112b0241e8a5004974118aa72609d2eabe8de1581465628560e1a6b72362fe1878e8e1a37b6a1ba9d5f')
b2sums_aarch64=('ddcae661fa1b2ff922a8691d4ec3b9524280995594958a5baddd1180657e38b8868759dbb5d13a69a221a1810f70af317c5bc16faad00043d1ecca18bbe5cfd6')

package() {
     cd "$srcdir"
     install -Dm755 intelli-shell "$pkgdir/usr/bin/intelli-shell"
     install -Dm644 README.md     "$pkgdir/usr/share/doc/intellishell/README.md"
     install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/intellishell/LICENSE"
}
