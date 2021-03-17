# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-frippery
pkgver=3.38.0
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=3.38')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
md5sums=('735018c49a6d0c0515d9318b19bc0ff0')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
