# Maintainer : Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: Lars Boettcher

pkgname=csound-doc
pkgver=6.08.0
pkgrel=2
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
optdepends=('csound')
# This is a hardcoded link because the devs change the naming convention often.
source=("https://github.com/csound/csound/releases/download/b6.08.0/Csound6.08_manual_html.zip")
sha256sums=('1ac442112bcd3b9e698070e3e8cd30a71b6a9b02b403a1d43b736544ea2243b6')

package() {
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  find "$pkgdir" -type f -exec chmod 644 {} \;
}
