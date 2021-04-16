# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-beefweb-bin
pkgver=0.4
pkgrel=4
_buildhash='849ecad6f1cc40b981193b69fae1c6e4'
_fooname='foo_beefweb'
pkgdesc='A web interface/REST API component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
md5sums=('c72375b77f4dc44a6505eaf3386dc204')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"

  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/index.html"
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/bundle.js"
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/bundle.css"
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/sprite.svg"
}

