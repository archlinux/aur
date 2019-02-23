# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk
_name=${pkgname#python-}
_py=py3
pkgver=1.2.13
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python"
arch=('any')
url="https://github.com/ivknv/yadisk"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("7f88e9235dd4ae22c218f48b85e05bae445effd1f3db1ea4d543a2390819e643")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
