# Maintainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Maintainer: Michael <th-nuernberg.de: bauermi86944>

pkgname=pandoc-eqnos
pkgver=2.5.0
pkgrel=1
pkgdesc="Equation number filter for pandoc"
url="https://github.com/tomduck/pandoc-eqnos"
depends=('pandoc-xnos>=2.5.0' 'pandoc-xnos<3.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-eqnos/archive/${pkgver}.tar.gz")
md5sums=('f59a2933c342d7e702812ba01afc58dc')

build() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
