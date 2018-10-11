# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk
_name=${pkgname#python-}
_py=py3
pkgver=1.2.12
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python"
arch=('any')
url="https://github.com/ivknv/yadisk"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("794012997292d9a4bc858099871f952c9af987ad685f1ce06b5dd741b1f1cc97")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
