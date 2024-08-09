# Maintainer: Justin ! <just1602@riseup.net>
# Ex Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname='mtail'
pkgname="${_pkgname}-bin"
pkgver=3.0.8
pkgrel=1
pkgdesc='extract whitebox monitoring data from application logs for collection in a timeseries database'
arch=('x86_64')
url='https://github.com/google/mtail'
license=('Apache')
conflicts=("${_pkgname}")
source=("https://github.com/google/mtail/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('123c2ee5f48c3eff12ebccee38befd2233d715da736000ccde49e3d5607724e4')

package() {
  cd "${srcdir}"

  install -Dm755 "mtail" "${pkgdir}/usr/bin/mtail"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
