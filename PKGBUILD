# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=viper-sh
pkgname=$_pkgname
pkgver=1.0.1
pkgrel=1
pkgdesc="A Bourne Shell, CLI only, Northstar updater and mod manager "
arch=('any')
url="https://github.com/0neGal/viper-sh"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1b0492914ebe63241592cd32b903dba5c692543456bec687ab8b97602e0dd72')

package() {
  cd viper-sh-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 viper-sh -t "$pkgdir/usr/bin"
}
