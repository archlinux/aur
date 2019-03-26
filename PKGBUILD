# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk
_name=${pkgname#python-}
_py=py3
pkgver=1.2.14
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python"
arch=('any')
url="https://github.com/ivknv/yadisk"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("c4abdcd56b6640179ed41f6662aeab9756755fe0d0709ce82905167f6c89d0e6")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
