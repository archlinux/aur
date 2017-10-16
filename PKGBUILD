# Maintainer: Haoda Wang <harry at h313 dot info>

pkgname=doitlive
pkgver=3.0.0
pkgrel=1
pkgdesc="Because sometimes you need to do it live."
url="https://github.com/sloria/doitlive"
depends=('python' )
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/75/68/44b16599a252364964bebf1f1f59f03e9d3a1fcd9049dc877b3b9682bafa/doitlive-3.0.0.tar.gz')
md5sums=('6d08a427f2d967fb3fc3b6e4110d80d8')

build() {
    cd $srcdir/doitlive-3.0.0
    python setup.py build
}

package() {
    cd $srcdir/doitlive-3.0.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
