# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pilgo-bin
_binname=plg
pkgver=0.5.0
pkgrel=3
pkgdesc='Configuration-based symlink farm manager CLI and framework'
arch=('x86_64')
url='https://github.com/gbrlsnchs/pilgo'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/linux.tar.gz")
sha256sums=('1763520058af9d25c480530500ef85693bf0cc700d41e86125f85794c9b09914')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "$_binname" "$pkgdir/usr/bin/$_binname"
}
