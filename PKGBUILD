# Maintainer: Yiyao Yu <yuydevel at protonmail com>

_pkgname=dptfxtract
pkgname="${_pkgname}-bin"
pkgver=1.4
pkgrel=1
pkgdesc="Intel's Linux DPTF Extract Utility for generating thermald's thermal_conf.xml"
arch=('x86_64')
url="https://github.com/intel/dptfxtract"
license=('custom:Binary License')
provides=('dptfxtract')
conflicts=('dptfxtract')
depends=('thermald')
source=("https://github.com/intel/dptfxtract/archive/v${pkgver}.tar.gz")
sha256sums=('74bf633dc0eeceeef7ef3c0b15e0bf1e8c5ec0ca44ce82549a8560c76dde2901')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 'dptfxtract' "${pkgdir}/usr/bin/dptfxtract"
  install -Dm 644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

