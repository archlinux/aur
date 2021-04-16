# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-jesus-bin
pkgver=10
pkgrel=4
_buildhash='7b548bfc4637d042f7ef591b393df0ec'
_fooname='foo_jesus'
pkgdesc='A backup/restore component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}-v${pkgver}.zip")
md5sums=('a547dfc2dbe23c30d020f66d2b40b1e7')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

