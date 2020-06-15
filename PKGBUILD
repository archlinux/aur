# Maintainer: Sai Valla <saivdev@protonmail.com>

pkgname=python-i3-grid
pkgver=0.2.3b3
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
source=('https://files.pythonhosted.org/packages/49/29/f96b8a9ede685cd686e0fbd7f896479cbc97ade399c7afe570cd5bdf8a1c/i3-grid-0.2.3b3.tar.gz')
md5sums=('7fb45dbe8ee8ab495ff18c5158faec24')

build() {
    cd $srcdir/i3-grid-0.2.3b3
    python setup.py build
}

package() {
    cd $srcdir/i3-grid-0.2.3b3
    python setup.py install --root="$pkgdir" --optimize=1
}

