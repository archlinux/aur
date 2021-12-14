# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
provides=('rav1e')
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-aarch64-linux.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('51fb44073f8917b8859319aae5d9ad91d9c8b9a53fe4698b6a845ede835fcd66')
sha256sums_aarch64=('1a55635567e28145721e5a0d4ce0eb085ca9ff2533c993a32dfda165d023fe7b')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/rav1e"
}
