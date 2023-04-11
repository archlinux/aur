# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
provides=("rav1e=$pkgver")
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-sse4.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-aarch64.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('ca3f84522231830330a05e05aba6ff305216a3cf7180f53523f6e13f535389ed')
sha256sums_aarch64=('3b34816403ebe121184056be5d26159f97b0885a42684119c7ca8a5b0d747032')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/rav1e"
}
