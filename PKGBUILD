# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=viper-sh
pkgname=$_pkgname
pkgver=1.0.2
pkgrel=1
pkgdesc="A Bourne Shell, CLI only, Northstar updater and mod manager"
arch=('any')
url="https://github.com/0neGal/viper-sh"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a19871ff450f2ae3d1d69b93a16126bf7c4df8dadc27e842209b409fef128304')

package() {
  cd viper-sh-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 viper-sh -t "$pkgdir/usr/bin"
}
