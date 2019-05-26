# Maintainer: basigur

pkgname=papirus-folders-nordic
pkgver=3.5
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic."
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=()
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("https://github.com/basigur/papirus-folders/archive/v$pkgver.tar.gz?/papirus-folders-nordic-v$pkgver.tar.gz")

sha512sums=('71891e05a4d7c421d8df4499d0bf1957f876f81ad49fec72e902d3e308561817da3d53cf92deb479ec0689c04aa74dff059ab238b67fd3c11e12106fd24c0fe0')


package() {
 cd papirus-folders-$pkgver/$pkgname

  install -d "$pkgdir/usr/share/icons"

  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  cp -r Papirus-Dark-nordic Papirus-Light-nordic Papirus-nordic ePapirus-nordic \
  Papirus-Dark-nordic-folders Papirus-Light-nordic-folders Papirus-nordic-folders \
  ePapirus-nordic-folders $pkgdir/usr/share/icons/

}


