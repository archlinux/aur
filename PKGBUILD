# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-musical-spectrum-bin
pkgver=0.9.1
pkgrel=4
_fooname='foo_musical_spectrum'
pkgdesc='A spectrum analyser visulisation component for foobar2000'
arch=('any')
url='https://wiki.hydrogenaud.io/index.php?title=Foobar2000:Components/Musical_Spectrum_(foo_musical_spectrum)'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=('https://hydrogenaud.io/index.php?action=dlattach;topic=97404.0;attach=7189')
md5sums=('5a7317c95ead1ac48d05cf5512337a95')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

