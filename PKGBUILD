# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-wave-minibar-mod-bin
pkgver=10.0.46
pkgrel=1
_buildhash='244550eef454aa5ee131956d27d36b42'
_fooname='foo_wave_minibar_mod'
pkgdesc='A seekbar waveform component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://www.foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
sha256sums=('fc3c4dcea37ce3a054555039c1fc344718d408ca0d7bc611b3bfa972850cedbf')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

