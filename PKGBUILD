# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=VK-Scraper
pkgname=vk-scraper
pkgver=2.0.3
pkgrel=1
pkgdesc="Scrapes a VK user's photos"
arch=('any')
url='https://github.com/vanyasem/VK-Scraper'
license=('GPL3')
#depends=('python-vk_api' 'python' 'python-requests' 'python-tqdm' 'youtube-dl')
makedepends=('python-setuptools')
provides=('vk-scraper')
conflicts=('vk-scraper')
source=("https://github.com/vanyasem/VK-Scraper/archive/v$pkgver.tar.gz")
sha256sums=('5ae97f664f1f3bfbd80115144273db4f4a38dd9c2622cfa3fdd7f1161a14310c')

package() {
  cd "$srcdir/$appname-$pkgver"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
