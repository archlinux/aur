# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=(python-vk_api python2-vk_api)
_pkgname=vk_api
pkgver=11.5.0
pkgrel=2
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
url='https://github.com/python273/vk_api'
arch=(any)
license=(APACHE)
depends=()
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('107c8e99826ebae996203ec514116ab038d3d69c702d52819c133f11adbb3d2c')

package_python-vk_api() {
  depends=(python python-requests python-beautifulsoup4)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-vk_api() {
  depends=(python2 python2-requests python2-enum34 python2-beautifulsoup4)

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
