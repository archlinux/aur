# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=foobar2000-component-ui-columns-bin
pkgver=1.6.0
pkgrel=4
_buildhash='9ea5bf12dff419ecb6e39f820c4eb97f'
_fooname='foo_ui_columns'
pkgdesc='An alternative user interface for foobar2000'
arch=('any')
url="https://www.foobar2000.org/components/view/${_fooname}"
license=('unknown')
depends=('foobar2000>=1.0.0')
source=("https://yuo.be/static/${_buildhash}/${_fooname}-${pkgver}.fb2k-component")
md5sums=("${_buildhash}")

package() {
  install -Dm644 -t "$pkgdir/usr/share/foobar2000/components/${_fooname}" "$srcdir/${_fooname}.dll"
}

