# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Contributor: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=2.2.0
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('pandoc-xnos>=2.0.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('4223327adbb46fbb05ba2c785573da01')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
