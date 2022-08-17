# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk
_name=${pkgname#python-}
_py=py3
pkgver=1.2.16
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python"
arch=('any')
url="https://github.com/ivknv/yadisk"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("a27706c00b6cf20d7fda5fb010e75b0ff4380bbc3d8ee45ae846f1bef602a161")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
