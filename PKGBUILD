# Maintainer : Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: Lars Boettcher

pkgname=csound-doc
pkgver=6.06
pkgrel=1
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
depends=('csound')
source=("https://github.com/csound/csound/releases/download/6.06.0/Csound${pkgver}_manual_html.zip")
sha256sums=('c5dd68d5506837f152d672c96e45ab6c1a5141448a543dd656ad2b6b421959b8')

package() {
  # docs
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  # permissions
  find "$pkgdir" -type f -exec chmod 644 {} \;
}
