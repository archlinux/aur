# Maintainer: Yiyao Yu <yuydevel at protonmail com>

_pkgname=dptfxtract
pkgname="${_pkgname}-bin"
pkgver=1.4.2
pkgrel=1
pkgdesc="Intel's Linux DPTF Extract Utility for generating thermald's thermal_conf.xml"
arch=('x86_64')
url="https://github.com/intel/dptfxtract"
license=('custom:Binary License')
provides=('dptfxtract')
conflicts=('dptfxtract')
depends=('thermald')
source=("https://github.com/intel/dptfxtract/archive/v${pkgver}.tar.gz")
sha256sums=('8b6b1d62d2de9ebabbe9e94311ae7a821bbdb05cd4e9c5e2405730026e071ea0')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 'dptfxtract' "${pkgdir}/usr/bin/dptfxtract"
  install -Dm 644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

