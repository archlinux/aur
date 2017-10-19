# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver='2.2.0'
_pkgver="${pkgver}-0"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
makedepends=('sassc' 'optipng' 'parallel')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('f32c839d805c9febf3fafe52107bdcde7ec442aab029d422b9b9d2cc881f9f92')

build() {
  cd "${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
