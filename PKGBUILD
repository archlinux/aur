# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=vk_api
pkgname=(python-vk_api python2-vk_api)
pkgver=9.3.2
pkgrel=3
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
arch=('any')
url='https://github.com/python273/vk_api'
license=('APACHE')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('7e5c51051a2c27afd7b0767515a461eb9bbd0871675edc0f5058aa3c418bc59f')

package_python-vk_api() {
  depends=('python' 'python-requests' 'python-beautifulsoup4')
  cd "$srcdir/$appname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-vk_api() {
  depends=('python2' 'python2-requests' 'python2-enum34' 'python2-beautifulsoup4')
  cd "$srcdir/$appname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
