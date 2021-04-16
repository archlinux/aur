# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-typefind-bin
pkgver=0.3.1
pkgrel=4
_buildhash='b15abfd90d711bd0b81e90083b16fa39'
_fooname='foo_uie_typefind'
pkgdesc='A Columns UI search bar for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0' 'foobar2000-component-ui-columns-bin>=1.0.0')
source=("https://yuo.be/static/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
md5sums=("${_buildhash}")

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

