# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Contributor: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=0.21.1
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('pandoc-xnos>=0.9.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('f7072570c54ad682e5b36e53ada37363')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
