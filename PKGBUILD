# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=1.1.0
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
provides=('papirus-icon-theme' 'papirus-folders-nordic')
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache')
source=("https://github.com/basigur/papirus-folders/releases/download/$pkgver/$pkgname.deb")

sha512sums=("a2ea1df7bb992e9ade352900d059cf3a66b829d0cf335a952d4da753e04f1f28446a484489150d0555defab0af7e9745f5626e9a306bfc5f565adaf42b61fe5c")

package() {
  tar -xJf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/$pkgname"/LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
  
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic/

  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic-folders/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic-folders/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic-folders/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic-folders/

}
