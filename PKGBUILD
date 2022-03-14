# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-beefweb-bin
pkgver=0.5
pkgrel=2
_buildhash='8b5a3dbb77c02c9d3ea19e0d74c191de'
_fooname='foo_beefweb'
pkgdesc='A web interface/REST API component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("${_fooname}-${pkgver}-${pkgrel}.fb2k-component::https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
sha256sums=('2a6959ad105a4e0bfacaebc09c65406db5e358a3dc3a818c1f4dfe1233c08042')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"

  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/index.html"
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/bundle.js"
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/bundle.css"
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}/beefweb.root" "$srcdir/beefweb.root/sprite.svg"
}

