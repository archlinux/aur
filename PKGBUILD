# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.5
pkgrel=1
pkgdesc="Nazca module for photonic integrated circuit design."
arch=(any)
url="https://nazca-design.org/"
license=("AGPLv3+")
depends=("python" "python-pyclipper" "python-pandas" "python-matplotlib" "python-pillow" "ipython")
sha256sums=('c89b3a2334d3b3b1baed5eedee66ee5005a9e1a4068db8a36df95e2ed034adfa')
source=("https://nazca-design.org/dist/$pkg-$pkgver.zip")

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
