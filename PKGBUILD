# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-typefind-bin
pkgver=0.3.1
pkgrel=1
_buildhash="b15abfd90d711bd0b81e90083b16fa39"
pkgdesc="A Columns UI search bar for foobar2000"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_uie_typefind"
license=('unknown')
depends=('foobar2000>=1.0.0' 'foobar2000-component-ui-columns-bin>=1.0.0')
source=("https://yuo.be/static/${_buildhash}/foo_uie_typefind-${pkgver}.fb2k-component")
md5sums=('b15abfd90d711bd0b81e90083b16fa39')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" "$srcdir/foo_uie_typefind.dll"
}

