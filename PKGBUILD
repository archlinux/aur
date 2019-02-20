# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=1.0.0
pkgrel=1
pkgdesc="Icons themes papyrus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
provides=('papirus-icon-theme' 'papirus-folders-nordic')
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache')
source=("https://github.com/basigur/papirus-folders/releases/download/$pkgver/$pkgname.deb")

sha512sums=("3fa8f7d3176523c6937e7826d8c44068c3d35a6133a5c06ea69bcb4cc5705b0456cccced3791032c0e7da852418f9f2369b9a68aad1e877b79f9410aac32d1bd")

package() {
  tar -xJf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/$pkgname"/LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE 
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic/

}
