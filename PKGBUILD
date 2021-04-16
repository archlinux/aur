# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-vst-bin
pkgver=0.9.0.3
pkgrel=4
_fooname='foo_vst'
pkgdesc='A VST component for foobar2000'
arch=('any')
url='https://hydrogenaud.io/index.php/topic,84947.0.html'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=('https://hydrogenaud.io/index.php?action=dlattach;topic=84947.0;attach=6385')
md5sums=('75adfc67b3c9d992fcf07916153e5b97')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

