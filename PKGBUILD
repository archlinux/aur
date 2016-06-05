# Maintainer: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=0.14
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('pandoc-xnos')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('61f877a03be6ddb191913f01f0edef73')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
