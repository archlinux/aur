# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=2.1
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/archive/v$pkgver.tar.gz?/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('508A00AC13F8FB926AB1EAE3479C2EBAD5214B721DBA45B06D9A7848321A9E749356BCA17BD5562BBA41B9E9E68913267184492355C13F227CB7929641E14FCE')


package() {
 cd papirus-folders-$pkgver/$pkgname

  install -d "$pkgdir/usr/share/icons"

  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  cp -r Papirus-Dark-nordic Papirus-Light-nordic Papirus-nordic ePapirus-nordic \
  Papirus-Dark-nordic-folders Papirus-Light-nordic-folders Papirus-nordic-folders \
  ePapirus-nordic-folders $pkgdir/usr/share/icons/

}


