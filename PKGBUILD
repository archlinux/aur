# Maintainer : Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: Lars Boettcher

pkgname=csound-doc
pkgver=6.09.1
pkgrel=1
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
optdepends=('csound')
# This is a hardcoded link because the devs change the naming convention often.
source=("https://github.com/csound/csound/releases/download/6.09.1/Csound6.09.1_manual_html.zip")
sha256sums=('b2e8ef90e43762c64643c6adddb1e276ac6b496b4fe64fe83e2b8393dbd69100')

package() {
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  find "$pkgdir" -type f -exec chmod 644 {} \;
}
