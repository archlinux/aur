# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=5.0.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('python-numpy')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('73cc8b494399eace548662543a545dc0a67444c2d81029d46fdf269a602159139cfadd2a910b1a0a76e6931c73e2993e59167efbaff6809636a6b3d13c9630f0')

package() {

    cd SpiceyPy-$pkgver

    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
