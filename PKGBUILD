# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk-async
_name=${pkgname#python-}
_py=py3
pkgver=1.3.3
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python with async/await support"
arch=('any')
url="https://github.com/ivknv/yadisk-async"
license=('LGPL3')
depends=('python>=3.6.0' 'python-aiohttp')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("855bebceeaf76e54b52116486d2c79eff452f4bbf25ea4863a8b44d3b9fb221b")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
