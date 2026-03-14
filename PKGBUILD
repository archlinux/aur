# Maintainer: lalala <lalala_233@qq.com>

_name=dashscope
pkgname=python-${_name}
pkgver=1.25.13
pkgrel=1
pkgdesc='Python sdk for dashscope'
url='https://github.com/dashscope/dashscope-sdk-python'
arch=('any')
license=('Apache 2.0')
depends=('python-aiohttp' 'python-requests' 'python-websocket-client' 'python-cryptography' 'python-certifi')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('03e7ce41954bacc3786ec3f45d5dc01e1a8ccf2741503ce3dc9e4ce60866386e')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
