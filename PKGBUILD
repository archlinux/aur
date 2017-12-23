# Maintainer : Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: Lars Boettcher

pkgname=csound-doc
pkgver=6.10.0
pkgrel=1
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
optdepends=('csound')
# This is a hardcoded link because the devs change the naming convention often.
source=("https://github.com/csound/csound/releases/download/6.10.0/Csound6.10.0_manual_html.zip")
sha256sums=('1f3bc78e7826cc32b0fa43f73b60a9f8b2ee09c3c47118bcb9d5e8649b66dbcf')

package() {
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  find "$pkgdir" -type f -exec chmod 644 {} \;
}
