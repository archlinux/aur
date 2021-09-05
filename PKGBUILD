# Maintainer: Asthowen <contact@asthowen.fr>

pkgname='python-alphacodersdownloader'
pkgver=0.1.0
pkgrel=1
pkgdesc="A script for download backgrounds on https://alphacoders.com written in Python."
arch=('any')
url='https://github.com/Asthowen/AlphacodersWallpaperDownloader/'
license=('GNUv3')
makedepends=('python-setuptools')
depends=('python>=3.6' 'python-aiohttp' 'python-aiofiles' 'python-beautifulsoup4')
source=("https://pypi.io/packages/source/A/AlphacodersDownloader/AlphacodersDownloader-$pkgver.tar.gz")
sha256sums=('5eb2a9ca7b4f3cb5f8496357d755930d3f83ec276aff4df39b52f16f33b94db7')

build() {
  cd AlphacodersDownloader-$pkgver
  python setup.py build
}

package() {
  cd AlphacodersDownloader-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}