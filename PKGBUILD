# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-stop-on-error-bin
pkgver=0.6
pkgrel=4
_buildhash='9b4eb0c819ef7444f69a660dd9826808'
_fooname='foo_stop_on_error'
pkgdesc='Stops playback after tracks fail to play'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://foobar2000.org/getcomponent/${_buildhash}/${_fooname}.fb2k-component")
md5sums=('e1bfb5b69bfe30ffc18b7735d3307c07')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

