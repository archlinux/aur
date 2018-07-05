# Maintainer: BrainDamage
pkgname="python-wfdb"
pkgver=2.2.0
pkgrel=1
pkgdesc="A library of tools for reading, writing, and processing WFDB signals and annotations"
arch=(any)
url="https://github.com/MIT-LCP/wfdb-python"
license=("MIT")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-nose" "python-pandas" "python-requests" "python-scikit-learn")
sha256sums=('d93fdad3950edfb6edd3724c5e5019ca351f81fa599f98f54a43051f41888cc8')
source=("https://github.com/MIT-LCP/wfdb-python/archive/$pkgver.tar.gz")

package() {
	cd "$srcdir/wfdb-python-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
