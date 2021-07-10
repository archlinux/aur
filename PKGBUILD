# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk-async
_name=${pkgname#python-}
_py=py3
pkgver=1.3.2
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python with async/await support"
arch=('any')
url="https://github.com/ivknv/yadisk-async"
license=('LGPL3')
depends=('python>=3.6.0' 'python-aiohttp')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("e64c9bc2b05541221d7467c120758e678f3377101b2c8b2760df8607b70b515b")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
