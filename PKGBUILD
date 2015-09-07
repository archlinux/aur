# Maintainer: Egan McComb <egan.mccomb@gmail.com>

pkgname=gtk-theme-murrine-collection
pkgver=0.98.6
pkgrel=1
pkgdesc="A collection of Murrine GTK2 themes"
license=('GPL')
arch=('any')
url="https://launchpad.net/murrine-themes"
depends=('gtk-engine-murrine')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/murrine-themes_0.98.6ubuntu1.tar.gz)
md5sums=('0f6d64a0bb3eb8aa7e5c85eab92cd1d3')

package() {
  mkdir -p "$pkgdir/usr/share/themes"
  cd $srcdir/murrine-themes-0.98.6ubuntu1/
  mv usr/share/themes/* "$pkgdir/usr/share/themes/"
}
