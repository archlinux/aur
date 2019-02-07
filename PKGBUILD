# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-pywsd
pkgver=1.1.7
pkgrel=1
pkgdesc='Python Implementations of Word Sense Disambiguation (WSD) technologies'
arch=('any')
url=https://github.com/alvations/pywsd
license=('MIT')
depends=('python' 'python-nltk')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/2c/42/9ba0a5901669d213de1487e11906f7caf20283a9c686540176520998e1cd/pywsd-$pkgver.tar.gz")
sha256sums=('597ae8352c460f8748e1cba2f736d3c01df04ff3da2656d408c939dc52ccc920')

build() {
    cd $srcdir/pywsd-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/pywsd-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

