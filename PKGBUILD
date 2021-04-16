# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-scrobble-bin
pkgver=1.5.0
pkgrel=4
_fooname='foo_scrobble'
pkgdesc='A last.fm scrobble component for foobar2000'
arch=('any')
url='https://hydrogenaud.io/index.php?topic=114979.0'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://github.com/gix/foo_scrobble/releases/download/v${pkgver}/foo_scrobble.fb2k-component")
md5sums=('30bcd99f659315a9a5e4d7dd7ad1a221')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

