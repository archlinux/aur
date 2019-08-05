# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.5.3
pkgrel=1
pkgdesc="Nazca module for photonic integrated circuit design."
arch=(any)
url="https://nazca-design.org/"
license=("AGPLv3+")
depends=("python" "python-pyclipper" "python-pandas" "python-matplotlib" "python-pillow" "ipython")
sha256sums=('81fdc50e3861c7baea03492b14da0c32cb7b3610deb17a182dabfe267a1dd582')
source=("https://nazca-design.org/dist/$pkg-$pkgver.zip")

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
