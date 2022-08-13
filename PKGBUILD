# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-wave-minibar-mod-bin
pkgver=10.0.49
pkgrel=1
_buildhash='bbd13f53b0b03474eac3f9c8d1bb4cdb'
_fooname='foo_wave_minibar_mod'
pkgdesc='A seekbar waveform component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("${_fooname}-${pkgver}-${pkgrel}.fb2k-component::https://www.foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
sha256sums=('16e03744465fa22f2f8f2688cbd07be66f9755e4f49779ea8861e0d1b9a13921')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

