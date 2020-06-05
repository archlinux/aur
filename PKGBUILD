# Maintainer: Sai Valla <saivdev@protonmail.com>

pkgname=python-i3-grid
pkgver=0.2.3b2
pkgrel=1
epoch=
pkgdesc='A i3wm grid controller for floating window automation.'
arch=(any)
url="https://github.com/justahuman1/i3-grid"
license=('GPL3')
groups=()
depends=('python-i3-py')
makedepends=('python3' )
checkdepends=()
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
source=('https://files.pythonhosted.org/packages/ac/2a/f38475c92a041093756f693fce47a7ed17ca46acda8f6f3785b66cdf0623/i3-grid-0.2.3b2.tar.gz')
md5sums=('2d58b731d962ab2a885a7efabce7c65a')

build() {
    cd $srcdir/i3-grid-0.2.3b2
    python setup.py build
}

package() {
    cd $srcdir/i3-grid-0.2.3b2
    python setup.py install --root="$pkgdir" --optimize=1
}

