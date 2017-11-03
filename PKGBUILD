# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver='2.2.3'
_pkgver="${pkgver}-0"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
makedepends=('sassc' 'optipng' 'parallel')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('910759e857f9bbd376d9db54b9119f49f78af782cb7f75d2df84a3f22a675de8')

build() {
  cd "${pkgname/pop-}-${_pkgver}"

  make
}

package() {
  cd "${pkgname/pop-}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
