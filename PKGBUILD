# Maintainer: Nelly Simkova (sk8higher at iballwasrawt dot ru)

appname=pyRegions
pkgname=pyregions
pkgver=1.0.2
pkgrel=1
pkgdesc="Telegram Bot - Car registration regions of Russia"
arch=('any')
url='https://github.com/sk8higher/pyRegions'
license=('GPL3')
depends=('python' 'python-pytelegrambotapi')
makedepends=('python-setuptools')
provides=('pyregions')
conflicts=('pyregions')
source=("https://github.com/sk8higher/pyRegions/archive/$pkgver.tar.gz")
sha256sums=('89cfbc6d089a02ab20c182f41a9b3307f35cc1989c2e81a559de853b996bee0d')

package() {
  cd "$srcdir/$appname-$pkgver"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et: 
