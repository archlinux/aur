# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-frippery
pkgver=43.0
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=43.0')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
sha256sums=('3a0d20be05bcac87b4d2221bf93e64f5c918ffd14b93d7be3bda920c8bf111eb')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
