# Maintainer: Justin ! <just1602@riseup.net>
# Ex Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname='mtail'
pkgname="${_pkgname}-bin"
_pkgver=3.0.0-rc59
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='extract whitebox monitoring data from application logs for collection in a timeseries database'
arch=('x86_64')
url='https://github.com/google/mtail'
license=('Apache')
conflicts=("${_pkgname}")
source=("https://github.com/google/mtail/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_linux_amd64.tar.gz")
sha256sums=('744cc3e75fb0ab2322843fde44cb82de3883b62531cec9e45cc7bd7d85d3384f')

package() {
  cd "${srcdir}"

  install -Dm755 "mtail" "${pkgdir}/usr/bin/mtail"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
