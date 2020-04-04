# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver=4.0.0
pkgrel=1
pkgdesc='System76 Pop GTK+ Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL-2.0' 'CCPL:BY-SA')
makedepends=('inkscape' 'sassc' 'optipng' 'parallel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}-b2.tar.gz")
md5sums=('e6616cda11777256db762e979675e80f')

build() {
  cd "${pkgname/pop-}-${pkgver}-b2"
  make
}

package() {
  cd "${pkgname/pop-}-${pkgver}-b2"
  make DESTDIR="${pkgdir}" install
}
# vim: ts=2 sw=2 et: