# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
provides=('rav1e')
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver-alpha/rav1e-$pkgver-alpha-linux.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver-alpha/rav1e-$pkgver-alpha-aarch64-linux.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('4c38bc7659ae899540da59750416dc138e082725b961c881b610f72cc6450933')
sha256sums_aarch64=('e48d42c3d7117f42b13d8dbbe80db4b0dc7c928db895eb3907459c657ed77b34')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rav1e"
  install -Dm644 "PATENTS" -t "$pkgdir/usr/share/licenses/rav1e"
}
