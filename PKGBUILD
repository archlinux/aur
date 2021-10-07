# Maintainer: Bart Libert <bart dot aur at libert dot email>
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

pkgname=pockyt
pkgver=1.4.6
pkgrel=2
pkgdesc="automate and manage your pocket collection"
url="https://github.com/arvindch/pockyt"
depends=('python' 'python-parse')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arvindch/pockyt/archive/$pkgver.tar.gz")
sha256sums=('91c4e89dec141b8999feeab963fb652ea2026147ced44eea449c05d7d464cccf')


build() {
    cd $srcdir/pockyt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pockyt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
