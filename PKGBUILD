# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-dsp-effect-bin
pkgver=0.47
pkgrel=5
_buildhash='c68827098aaa59f1a85760feafbe76eb'
_fooname='foo_dsp_effect'
pkgdesc='A DSP effect component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
md5sums=('2face3c532a4faa00bfd2b9527ba7fca')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

