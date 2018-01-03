# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=VK-Scraper
pkgname=vk-scraper
pkgver=1.3.0
pkgrel=1
pkgdesc="Scrapes a VK user's photos"
arch=('any')
url='https://github.com/vanyasem/VK-Scraper'
license=('GPL3')
depends=('python-vk_api' 'python' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
provides=('vk-scraper')
conflicts=('vk-scraper')
source=("https://github.com/vanyasem/VK-Scraper/archive/v$pkgver.tar.gz")
sha256sums=('242241f555294e1786a2519716518bae5dd88a42e4e0bca73a76564026f1ac2a')

package() {
  cd "$srcdir/$appname-$pkgver"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
