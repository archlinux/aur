# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-upnp-bin
pkgver=0.99.49
pkgrel=4
_buildhash='a770ee30b100186fc8e2fe243a383808'
_fooname='foo_upnp'
pkgdesc='A UPNP/DLNA renderer, media server and control point for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
md5sums=('adfbc003d4433292f4c1a842f5fd3680')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

