# Maintainer: BrainDamage
pkgname=python2-scikit-rf
pkgver=0.14
pkgrel=2
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
md5sums=("32dad98c349b72912a5529f940741f34")
source=("https://pypi.python.org/packages/source/s/scikit-rf/scikit-rf-$pkgver.zip")

package() {
	cd "$srcdir/scikit-rf-$pkgver"
	python2 setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
