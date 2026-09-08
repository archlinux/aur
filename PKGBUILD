# Maintainer: lalala <lalala_233@qq.com>

_name=dashscope
pkgname=python-${_name}
pkgver=1.27.4
pkgrel=1
pkgdesc='Python sdk for dashscope'
url='https://github.com/dashscope/dashscope-sdk-python'
arch=('any')
license=('Apache 2.0')
depends=('python-aiohttp' 'python-requests' 'python-websocket-client' 'python-cryptography' 'python-certifi' 'python-typer' 'python-rich' 'python-httpx' 'python-httpx-sse' 'python-typing_extensions')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('360991e9305a4dd25f225ed9f46c9f16be6313f79f02e1e67b5105e46a427250')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
