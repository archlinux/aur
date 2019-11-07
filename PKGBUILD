# Maintainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Maintainer: Michael <th-nuernberg.de: bauermi86944>
# Contributor: <gmail.com: jese.jaara>

pkgname=pandoc-fignos
pkgver=2.4.0
pkgrel=1
pkgdesc="Figure number filter for pandoc"
url="https://github.com/tomduck/pandoc-fignos"
depends=('pandoc-xnos>=2.5.0' 'pandoc-xnos<3.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-fignos/archive/${pkgver}.tar.gz")
md5sums=('582de1eef11e659e067f323e574bcb31')

build() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-fignos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
