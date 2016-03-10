# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=texlive-frakturx
pkgver=20070103
pkgrel=3
pkgdesc="Base package for typesetting Fraktur fonts with LaTeX. You will need at least one font package."
arch=('any')
url='http://www.gaehrken.de/fraktur'
license=('custom')
install=texlive-frakturx.install
source=('http://www.gaehrken.de/fraktur/base.zip')
md5sums=('f024b87f767c2deb5cdc51b954a94feb')

prepare() {
  find "$srcdir" -name '._*' -exec rm \{\} \;
}

package() {
  install -d "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/fonts" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/tex" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/doc" "$pkgdir/usr/share/texmf"
}
