# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-console-bin
pkgver=2.0.0
pkgrel=1
_buildhash='be77fbdf14eaec23fbf99070027b0b68'
_fooname='foo_uie_console'
pkgdesc='A Columns UI console panel for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0' 'foobar2000-component-ui-columns-bin>=1.0.0')
source=("https://yuo.be/static/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
md5sums=('be77fbdf14eaec23fbf99070027b0b68')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

