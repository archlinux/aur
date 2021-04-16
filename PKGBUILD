# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-ptb-bin
pkgver=3.0.4
pkgrel=4
_buildhash='9b4eb0c819ef7444f69a660dd9826808'
_fooname='foo_uie_ptb'
pkgdesc='A toolbar indicating playback status for foobar2000'
arch=('any')
url='https://skipyrich.com/wiki/Foobar2000:Playback_Toolbars'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("http://skipyrich.com/store/foo_uie_ptb.7z")
md5sums=('091cce9a9da3b0bad9d73d345289f631')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

