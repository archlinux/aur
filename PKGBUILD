# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Contributor: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=1.2.0
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('pandoc-xnos>=0.15.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('3b7f7b6b77dd66242cda8284e261dba9')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
