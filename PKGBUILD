# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-dsp-effect-bin
pkgver=0.50_beta1
pkgrel=1
_buildhash='ed0cc29d7dc25f9a9ec4fd5790567f42'
_fooname='foo_dsp_effect'
pkgdesc='A DSP effect component for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
md5sums=('6892c2772a878d2f0cb7afa8c2194994')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

