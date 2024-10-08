# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=viper-sh
pkgver=1.0.2
pkgrel=4
pkgdesc="A Bourne Shell, CLI only, Northstar updater and mod manager"
arch=('any')
url="https://github.com/0neGal/viper-sh"
license=('GPL-3.0-or-later')
depends=('bash')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a19871ff450f2ae3d1d69b93a16126bf7c4df8dadc27e842209b409fef128304')

package() {
  cd $pkgname-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
  ln -s /usr/bin/$pkgname "$pkgdir/usr/bin/vipersh"
}
