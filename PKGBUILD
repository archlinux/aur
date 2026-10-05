# Maintainer: lalala <lalala_233@qq.com>

_name=dashscope
pkgname=python-${_name}
pkgver=1.27.7
pkgrel=1
pkgdesc='Python sdk for dashscope'
url='https://github.com/dashscope/dashscope-sdk-python'
arch=('any')
license=('Apache 2.0')
depends=('python-aiohttp' 'python-requests' 'python-websocket-client' 'python-cryptography' 'python-certifi' 'python-typer' 'python-rich' 'python-httpx' 'python-httpx-sse' 'python-typing_extensions')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('e034664fc78d487bd949753807abc2640c154cfcecff7a59b8b2a4b6ec156bf9')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
