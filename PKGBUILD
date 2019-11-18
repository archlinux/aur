# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=python-vk_api
_pkgname=vk_api
pkgver=11.6.0
pkgrel=1
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
url='https://github.com/python273/vk_api'
arch=(any)
license=(APACHE)
depends=(python python-requests python-beautifulsoup4 python-websocket-client python-six)
makedepends=(python-setuptools)
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('4827b1a597f56406b0f775ff950aac800590c7c05b2f58014f357aee2a954edc')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
