# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-ui-columns-bin
pkgver=1.7.0
pkgrel=3
_buildhash='8190fc57de8a5a42057f3022ea79d637'
_fooname='foo_ui_columns'
pkgdesc='An alternative user interface for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("${_fooname}-${pkgver}-${pkgrel}.fb2k-component::https://yuo.be/static/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
sha256sums=('1031ca8f5b9726e8e9a18824928298202ce5ff9f46e3b3a80cbb1f513c4d8cb2')

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

