# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-uie-vis-peakmeter-spectrum-bin
pkgver=0.2.0.0
pkgrel=4
_fooname='foo_uie_vis_peakmeter_spectrum'
pkgdesc='A combined peakmeter/spectrum analyser component for foobar2000'
arch=('any')
url='https://hydrogenaud.io/index.php?topic=117098.0'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=('https://hydrogenaud.io/index.php?action=dlattach;topic=117098.0;attach=14175')
md5sums=('9379abb1bfca344bc4a88527aa3bb3d8')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

