# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver='2.0.7'
_pkgver="${pkgver}-0"
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/system76/pop-gtk-theme'
license=('GPL2' 'CCPL:by-sa')
makedepends=('sassc')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('4688173ef05939fbdff587fd16c852882661496c820edcd040a8dd9980803023')

build() {
  cd "${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
