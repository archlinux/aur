# Maintainer: Yiyao Yu <yuydevel at protonmail com>

_pkgname=dptfxtract
pkgname="${_pkgname}-static-bin"
pkgver=1.4.3
pkgrel=1
pkgdesc="Intel's Linux DPTF Extract Utility for generating thermald's thermal_conf.xml (Statically linked version)"
arch=('x86_64')
url="https://github.com/intel/dptfxtract"
license=('custom:Binary License')
provides=('dptfxtract')
conflicts=('dptfxtract')
depends=('thermald')
source=("https://github.com/intel/dptfxtract/archive/v${pkgver}.tar.gz")
sha256sums=('b8df8d91c356b553fb82ad9c5a06193a51c872c6f9bb87eeef713cb99c30a82d')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 'dptfxtract-static' "${pkgdir}/usr/bin/dptfxtract"
  install -Dm 644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

