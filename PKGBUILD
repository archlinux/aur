# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-frippery
pkgver=40.0
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=40.0')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
md5sums=('ffacfc880157ac03a9fae4c09310206f')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
