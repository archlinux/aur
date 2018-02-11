# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python2-hgnested
pkgver=0.8
pkgrel=1
pkgdesc="Mercurial extension to work with nested repositories"
arch=('any')
url="http://bitbucket.org/cedk/hgnested"
license=('GPL3')
depends=('python2' 'mercurial')
optdepends=()
makedepends=('python2')
md5sums=('39be601066db908b6fd1d4e19f98e0e3')
source=("https://pypi.io/packages/source/h/hgnested/hgnested-$pkgver.tar.gz")

build() {
    cd $srcdir/hgnested-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/hgnested-$pkgver
    python2 setup.py install --root=$pkgdir
}
