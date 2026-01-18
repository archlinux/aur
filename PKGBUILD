# Maintainer: sunplan
pkgname=nndownload
pkgver=1.19.2
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
         #'python-tqdm'
         'python-urllib3')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('538c9b2cb1fa1077a2852dc96316860b979a8887f2b4ada2d86d35bc39fdffa5')

package() {
	python -m installer --destdir="$pkgdir" $pkgname-$pkgver-py3-none-any.whl
}
