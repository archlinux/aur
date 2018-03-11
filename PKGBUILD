# Maintainer: BrainDamage
pkgname="python2-scikit-rf"
pkgver=0.14.8
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
sha256sums=('4254ad33b4c02f255cf36c73304854f59f44291ec583ea9c9c029746949b3b31')
source=("https://github.com/scikit-rf/scikit-rf/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python2 setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
