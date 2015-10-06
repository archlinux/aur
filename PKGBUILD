# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
pkgver=v20151004
pkgrel=1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contains chrome skin extension."
arch=('any')
url="http://gnome-look.org/content/show.php/Flat-Plat+3.14?content=167704"
license=('GPL')
depends=('librsvg' 'gtk-engine-murrine' 'gnome-session>=3.14')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://dl.dropboxusercontent.com/s/xmd3o9uw9euloez/Flat-Plat.tar.gz")
sha256sums=('231b93ad7b8db50ed71c1ce22734ee65683dd67f07a55058593a648a6b2d957b')

package() {
  cd "Flat-Plat"
  rm -rf chrome
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
