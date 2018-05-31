pkgname=python-brother_ql
pkgver=0.8.4
pkgrel=1
pkgdesc="Python package for the raster language protocol of the Brother QL series label printers"
url="https://github.com/pklaus/brother_ql"
depends=('python' 'python-future' 'python-packbits' 'python-pillow')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/brother_ql/brother_ql-$pkgver.tar.gz")
sha256sums=('d68381949ba6777f38d02fb9bd5db301669d560e4195863e0c396e5afadde6f0')

build() {
    cd "$srcdir/brother_ql-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/brother_ql-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
