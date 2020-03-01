# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.7.0
pkgrel=1
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
url='https://github.com/python273/vk_api'
arch=(any)
license=(APACHE)
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
makedepends=(python-setuptools)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('d7e75a7ddb8a3619e416d23161c9a4d9d688363dac105694faab26b603c30d87')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
