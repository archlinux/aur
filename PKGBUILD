# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver=3.1.2
pkgrel=1
pkgdesc='Version 2 of the Pop GTK+ Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
makedepends=('inkscape' 'sassc' 'optipng' 'parallel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0ae1223d88e4b55b5b0410a10676265f805bd74a759c74d0a26cd80b612ef296')

build() {
  cd "${pkgname/pop-}-${pkgver}"

  make
}

package() {
  cd "${pkgname/pop-}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
