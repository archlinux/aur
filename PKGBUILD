# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-lyrics3-bin
pkgver=0.5
pkgrel=4
_buildhash='36275d37f8e1c07b5927dba93a9312d5'
_fooname='foo_uie_lyrics3'
pkgdesc='A lyrics UI component for foobar2000 (column & default UI)'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('mit')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
md5sums=('bcd6efb8fc7c75ea0e3017f51864dd01')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

