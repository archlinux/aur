# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=vk_api
pkgname=(python-vk_api python2-vk_api)
pkgver=10.0
pkgrel=1
pkgdesc='Module for writing scripts for vk.com (vkontakte)'
arch=('any')
url='https://github.com/python273/vk_api'
license=('APACHE')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/python273/vk_api/archive/v$pkgver.tar.gz")
sha256sums=('a071d94eb0e79f75f7c93d64ec56286f40df448c69d7a10e16ea17a17e788ed7')

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
