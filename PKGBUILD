# Maintainer: Egan McComb <egan.mccomb@gmail.com>

pkgname=gtk-theme-murrine-collection
pkgver=0.98.11
pkgrel=1
pkgdesc="A collection of Murrine GTK2 themes"
license=('GPL')
arch=('any')
url="https://launchpad.net/murrine-themes"
depends=('gtk-engine-murrine')
source=(https://launchpad.net/debian/+archive/primary/+sourcefiles/murrine-themes/0.98.11/murrine-themes_0.98.11.tar.xz)
sha256sums=('dd9320f0d64669cc3a08d1ee46b6493ae06e15d28ab55b8d37ff94ada465bc25')

package() {
  mkdir -p "$pkgdir/usr/share/themes"
  cd $srcdir/murrine-themes/
  mv usr/share/themes/* "$pkgdir/usr/share/themes/"
}
