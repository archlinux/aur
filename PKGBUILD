# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver='2.1.2'
_pkgver="${pkgver}-0"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
makedepends=('sassc')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('60c79fa5acee95d7d972953fa5043e60e12ef1afe0180c1a8d0589d8e7c04400')

build() {
  cd "${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
