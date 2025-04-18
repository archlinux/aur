# Maintainer: sunplan
pkgname=nndownload
pkgver=1.19
pkgrel=1
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
sha256sums=('6830d465c5e26d48e213554d9dc16f15f5972ba121b11a2f73de3f35a2cbd904')

package() {
	python -m installer --destdir="$pkgdir" $pkgname-$pkgver-py3-none-any.whl
}
