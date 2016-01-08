# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=texlive-alteswab
pkgver=20060901
pkgrel=1
pkgdesc="Alte Schwabacher fraktur font for use with LaTeX."
arch=(any)
url="http://www.gaehrken.de/fraktur/"
license=('unknown')
groups=()
depends=(texlive-core texlive-frakturx)
makedepends=(unzip coreutils)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=texlive-alteswab.install
changelog=
source=(http://www.gaehrken.de/fraktur/talteswab.zip)
noextract=()
md5sums=('e373b69be815eb48dd4b0a4819a8eb79')

build() {
  return 0
}

package() {
  mkdir -p "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/fonts" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/tex" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/doc" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/dvips" "$pkgdir/usr/share/texmf"
}
