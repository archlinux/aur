# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp
pkgver=2.0
pkgrel=1
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
url='https://openpnp.org/'
license=('GPL3')
source=("${pkgname}::https://s3-us-west-2.amazonaws.com/openpnp/OpenPnP-unix-develop.tar.gz")
sha256sums=('SKIP')


package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  ln -sf "${pkgdir}/usr/bin/OpenPnP" "${pkgdir}/opt/${pkgname}/OpenPnP"
}
