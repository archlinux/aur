# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-ptb-bin
pkgver=0.4
pkgrel=1
_fooname='foo_uie_ptb'
pkgdesc='A toolbar indicating playback status for foobar2000'
arch=('any')
url='https://skipyrich.com/wiki/Foobar2000:Playback_Toolbars'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("http://skipyrich.com/store/foo_uie_ptb.7z")
sha256sums=('59b6d874e00dfbd3189cd21dff99f75a15e95c9780fcf282abe7712f1988d5e2')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

