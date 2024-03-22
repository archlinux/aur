# Contributor: cqzw555 <cqzw555@163.com>
# Contributor: phancb <nxhsdu@qq.com>
# Contributor: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>
# Contributor: Apple_QAQ <apple_qaq@outlook.com>

_py=py3
_pkgname=bilibili-api-python
pkgname=python-bilibili-api-python
pkgver=16.2.0
pkgrel=2
pkgdesc="The fork of module bilibili-api. 哔哩哔哩的各种 API 调用便捷整合（视频、动态、直播等），另外附加一些常用的功能。"
arch=('any')
url="https://github.com/Nemo2011/bilibili-api"
license=('GPL3')
makedepends=('python' 'python-installer')
depends=('python'
         'python-urllib3'
         'python-aiohttp'
         'python-beautifulsoup4'
         'python-colorama'
         'python-lxml'
         'python-pyyaml'
         'python-brotli'
         'python-httpx'
         'python-qrcode'
         'python-requests'
         'python-apscheduler'
         'python-rsa'
         'python-pillow'
         'python-tqdm'
         'python-yarl'
         'python-pycryptodomex'
         'python-qrcode_terminal'
)
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('af4682db5c2e5cf44cb0ca36f5f2f4350f377e9d5d2bc6644d308831d11bc2bd')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
}
