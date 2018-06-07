# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=(python-vk_api python2-vk_api)
_pkgname=vk_api
pkgver=10.1
pkgrel=1
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
url='https://github.com/python273/vk_api'
arch=(any)
license=(APACHE)
depends=()
makedepends=(python-setuptools)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('3f9648464a3fdcc5c85cd5b5af7e2dcad3661cb21467bc19132e4fb6037447b5')

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
