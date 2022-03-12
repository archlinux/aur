# Maintainer: Asthowen <contact@asthowen.fr>
# Maintainer: squitch <contact.squitch@gmail.com>

pkgname='python-alphacodersdownloader'
pkgver=0.1.4
pkgrel=1
pkgdesc='A script for download backgrounds on https://alphacoders.com written in Python.'
arch=('any')
url='https://github.com/Asthowen/AlphacodersDownloader/'
license=('GNUv3')
makedepends=('python-setuptools')
depends=('python>=3.6' 'python-aiohttp' 'python-aiofiles' 'python-setproctitle' 'python-beautifulsoup4')
source=("https://pypi.io/packages/source/A/AlphacodersDownloader/AlphacodersDownloader-$pkgver.tar.gz")

build() {
  cd AlphacodersDownloader-$pkgver
  python setup.py build
}

package() {
  cd AlphacodersDownloader-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
sha256sums=('50a99f95df69ac2adc26b07142abd06427e3df7917e13ef777386d62b3262b3a')
