# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-frippery
pkgver=48.1
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=46.0')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
sha256sums=('c6836c657d44144816c73af818c782ec4d4e8599e8656563d0db3ee5314e0946')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
