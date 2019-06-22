# Maintainer: Yiyao Yu <yuydevel at protonmail com>

_pkgname=dptfxtract
pkgname="${_pkgname}-bin"
pkgver=1.3
pkgrel=1
pkgdesc="Intel's Linux DPTF Extract Utility for generating thermald's thermal_conf.xml"
arch=('x86_64')
url="https://github.com/intel/dptfxtract"
license=('custom:Binary License')
provides=('dptfxtract')
conflicts=('dptfxtract')
depends=('thermald')
source=("https://github.com/intel/dptfxtract/archive/v1.3.tar.gz")
sha256sums=('c8efa83a15072a934f8288a19435d9f068ac2f6a1c7e6abbc4e986e199119f26')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 'dptfxtract' "${pkgdir}/usr/bin/dptfxtract"
  install -Dm 644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

