# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=1.0.0
pkgrel=3
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
provides=('papirus-icon-theme' 'papirus-folders-nordic')
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache')
source=("https://github.com/basigur/papirus-folders/releases/download/$pkgver/$pkgname.deb")

sha512sums=("1e0192084914d9ea5cf4b2d2213d38940755f18eaa7609310d5bdc936379c1520d69434251cb1c2b5da1aa478791b8805825dbba2d7bc602a6c725f534b471c2")

package() {
  tar -xJf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/$pkgname"/LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE 
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic/

}
