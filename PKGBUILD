# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=texlive-frakturx
pkgver=20070103
pkgrel=1
pkgdesc="Base package for typesetting Fraktur fonts with LaTeX. You will need at least one font package."
arch=(any)
url="http://www.gaehrken.de/fraktur/"
license=('unknown')
groups=()
depends=(texlive-core)
makedepends=(unzip findutils coreutils)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=texlive-frakturx.install
changelog=
source=(http://www.gaehrken.de/fraktur/base.zip)
noextract=()
md5sums=('f024b87f767c2deb5cdc51b954a94feb')

build() {
  find "$srcdir" -name '._*' -exec rm \{\} \;
}

package() {
  mkdir -p "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/fonts" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/tex" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/doc" "$pkgdir/usr/share/texmf"
}
