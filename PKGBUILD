# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-wave-minibar-mod-bin
pkgver=10.0.43
pkgrel=4
_buildhash='3668db0f2959233f296389cca6e24f8d'
_fooname='foo_wave_minibar_mod'
pkgdesc='A seekbar waveform component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://www.foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
md5sums=('bc68b9a74eb738b8333f45012d2340af')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

