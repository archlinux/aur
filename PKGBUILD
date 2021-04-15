# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-console-bin
pkgver=1.0.1
pkgrel=1
_buildhash="f14920501244d33fe0bad1f747233c9d"
pkgdesc="A Columns UI console panel for foobar2000"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_uie_console"
license=('unknown')
depends=('foobar2000>=1.0.0' 'foobar2000-component-ui-columns-bin>=1.0.0')
source=("https://yuo.be/static/${_buildhash}/foo_uie_console-${pkgver}.fb2k-component")
md5sums=("${_buildhash}")

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" "$srcdir/foo_uie_console.dll"
}

