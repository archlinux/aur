# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.1
pkgrel=1
_rpmver=11.2
pkgdesc='An OBS source service: running all the osc source-validator checks'
arch=('any')
url='https://build.opensuse.org/package/show?package=obs-service-source_validator&project=openSUSE%3ATools'
license=('GPL2')
depends=('osc-source_validator')
source=("http://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Factory/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('4902cd72c463e9481058dd2a9e00eae3')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/lib/obs/service
  install -m755 source_validator "${pkgdir}"/usr/lib/obs/service
  install -m644 source_validator.service "${pkgdir}"/usr/lib/obs/service
}
