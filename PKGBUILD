# Maintainer: Joost Bremmer <toost dot b at gmail dot com>
pkgname=skiller-ctl
pkgver=0.2
pkgrel=1
pkgdesc="control some of the additional features of Sharkoon skiller keyboards"
arch=('i686' 'x86_64')
url="https://github.com/anyc/skiller-ctl"
license=('GPL3')
#depends=('libusb>=1.0')
#makedepends=('libusb>=1.0')

source=("https://github.com/anyc/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('eccb19b9cbb5ab11f38b1c70cb50ebd6009927fe0ca06601aa3ec5a4eb5a8c5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim: set ts=2 sw=2 et:
