# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-frippery
pkgver=48.0
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=46.0')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
sha256sums=('b2365e5596a4ee27d91be064ee7c0dd931d848a58d13fcc4edda32cb2ea1c417')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
