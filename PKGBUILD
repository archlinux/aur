# Maintainer: BrainDamage
pkgname="python2-scikit-rf"
pkgver=0.14.5
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="http://scikit-rf-web.readthedocs.org"
license=("BSD")
depends=("python2" "python2-numpy" "python2-scipy" "python2-matplotlib")
optdepends=(
	"python2-pyvisa: for instrument control"
	"python2-pandas: for xls export"
	"python2-xlrd: for xls reading"
	"python2-xlwt: for xls writing"
	"ipython2: for interactive shell"
)
sha256sums=("d0b3d59f838f9b73b5f96aebe9e89e5d7a1237cf697c0c909bf5c71d56bd8dad")
source=("https://github.com/scikit-rf/scikit-rf/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python2 setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
