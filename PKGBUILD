# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-esplaylist-bin
pkgver=0.1.3.9
pkgrel=4
_fooname='foo_uie_esplaylist'
pkgdesc='A playlist component for foobar2000 (column & default UI)'
arch=('any')
url='http://foo2k.chottu.net/#esp'
license=('cc-by-3.0')
depends=('foobar2000>=1.0.0')
source=('http://foo2k.chottu.net/foo_uie_esplaylist.zip')
md5sums=('1b9ce59f12bff9e922f39337c44af77c')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

