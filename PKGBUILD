# Maintainer: Justin ! <just1602@riseup.net>
# Ex Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname='mtail'
pkgname="${_pkgname}-bin"
pkgver=3.0.7
pkgrel=1
pkgdesc='extract whitebox monitoring data from application logs for collection in a timeseries database'
arch=('x86_64')
url='https://github.com/google/mtail'
license=('Apache')
conflicts=("${_pkgname}")
source=("https://github.com/google/mtail/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('624c31a563acd76440e316bba6cdca604f5ec4106a0b25f2b185ab2b1dbb7f4a')

package() {
  cd "${srcdir}"

  install -Dm755 "mtail" "${pkgdir}/usr/bin/mtail"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
