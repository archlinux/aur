# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=2.2
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/archive/v$pkgver.tar.gz?/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('B981AB5F799B7E4387A51630615217D2EF45C5C2F2BB780A925EF9D9A51D56E64009B3683E1A80107E9A75D1C372A2768C3454AD0CC2C2048A74B2917693F3BE')


package() {
 cd papirus-folders-$pkgver/$pkgname

  install -d "$pkgdir/usr/share/icons"

  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  cp -r Papirus-Dark-nordic Papirus-Light-nordic Papirus-nordic ePapirus-nordic \
  Papirus-Dark-nordic-folders Papirus-Light-nordic-folders Papirus-nordic-folders \
  ePapirus-nordic-folders $pkgdir/usr/share/icons/

}


