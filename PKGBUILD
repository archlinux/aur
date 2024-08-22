# Maintainer: sunplan
pkgname=nndownload
pkgver=1.18
pkgrel=2
pkgdesc='Download and process links from Niconico (nicovideo.jp)'
arch=('any')
url='https://github.com/AlexAplin/nndownload'
license=('MIT')
depends=('python'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-beautifulsoup4'
         'python-ffmpeg-python'
         'python-gevent'
         'python-mutagen'
         'python-pycryptodome'
         'python-requests'
         'python-rich'
         'python-setuptools'
         'python-tqdm'
         'python-urllib3')
makedepends=('python-setuptools'
             'dos2unix')
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('f4cd35fa44c61ffbce6fa654d9711ec27b90d9d81acc74d4d642775365a9bbad')

package() {
	python -m installer --destdir="$pkgdir" $pkgname-$pkgver-py3-none-any.whl
}
