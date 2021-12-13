# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>
pkgname=python-spiceypy
pkgver=4.0.3
pkgrel=2
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python-numpy')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('8aa8d5fcaa54292fc0f3c99726232940248e3adf2c54c0a6a0b7237d811f2c16484579529fe624e418950e76e0f7fe3f93076d45c01587912f684e31e4adc8d2')

package() {

    cd SpiceyPy-$pkgver

    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
