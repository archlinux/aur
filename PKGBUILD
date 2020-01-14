# Based on a PKGBUILD for pasaffe found at https://github.com/felixonmars/aur3-mirror
# Previous Maintainer: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=pasaffe
pkgver=0.55
pkgrel=1
pkgdesc="Easy to use password manager for Gnome with a Password Safe 3.0 compatible database."
arch=('any')
url="https://launchpad.net/pasaffe"
license=('GPL3')
depends=(
    'apg'
    'gtk3'
    'python-gobject'
    'python-unidecode'
    'yelp'
)
makedepends=('python-distutils-extra')
install=
source=(http://launchpad.net/pasaffe/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('e535aafeee6e1684b2a506bd9c463da5')

package() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root "$pkgdir" --optimize=1
}
