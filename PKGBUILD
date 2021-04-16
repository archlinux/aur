# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-np-simple-bin
pkgver=1.9
pkgrel=4
_fooname='foo_np_simple'
pkgdesc='Keeps a templated file with information about the current track'
arch=('any')
url='https://skipyrich.com/wiki/Foobar2000:Now_Playing_Simple'
license=('unknown')
depends=('foobar2000>=1.0.0')
source=('http://skipyrich.com/store/foo_np_simple.7z')
md5sums=('4b70266781be5f8b86ff9a7f059c745c')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

