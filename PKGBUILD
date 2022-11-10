# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk-async
_name=${pkgname#python-}
_py=py3
pkgver=1.3.5
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python with async/await support"
arch=('any')
url="https://github.com/ivknv/yadisk-async"
license=('LGPL3')
depends=('python>=3.6.0' 'python-aiohttp')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("15bc402cfef49845d26fe31a34776014e7489fb6813c6702f09f1575f443ade8")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
