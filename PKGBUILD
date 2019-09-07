# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=VK-Scraper
pkgname=vk-scraper
pkgver=2.0.2
pkgrel=1
pkgdesc="Scrapes a VK user's photos"
arch=('any')
url='https://github.com/vanyasem/VK-Scraper'
license=('GPL3')
depends=('python-vk_api' 'python' 'python-requests' 'python-tqdm' 'youtube-dl')
makedepends=('python-setuptools')
provides=('vk-scraper')
conflicts=('vk-scraper')
source=("https://github.com/vanyasem/VK-Scraper/archive/v$pkgver.tar.gz")
sha256sums=('9af30c47c658756acc8be0fe1c20aeb097893547e35b880eb20c06610bef442d')

package() {
  cd "$srcdir/$appname-$pkgver"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
