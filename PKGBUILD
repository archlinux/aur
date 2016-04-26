# Maintainer: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=0.11
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('python' )
makedepends=('python-pandocfilters')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('7723c97560f893717f5010a845bbc777')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
