# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=texlive-alteswab
pkgver=20060901
pkgrel=2
pkgdesc="Alte Schwabacher fraktur font for use with LaTeX."
arch='any'
url="http://www.gaehrken.de/fraktur/"
license=('custom')
depends='texlive-core'
install=texlive-alteswab.install
source=(http://www.gaehrken.de/fraktur/talteswab.zip LICENSE)
md5sums=('e373b69be815eb48dd4b0a4819a8eb79'
         '9abe7cb05a0a9031cbaf9622b2c1a56d')

package() {
  mkdir -p "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/fonts" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/tex" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/doc" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/dvips" "$pkgdir/usr/share/texmf"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
