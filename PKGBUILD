# Maintainer : Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: Lars Boettcher

pkgname=csound-doc
pkgver=6.07.0
pkgrel=1
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
depends=('csound')
source=("https://github.com/csound/csound/releases/download/$pkgver/Csound${pkgver:0:-2}_manual_html.zip")
sha256sums=('e71f364aedf74f8fa3d9c4ba071326a630bfa8b408910ef7f9ac9f5347bf669c')

package() {
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  find "$pkgdir" -type f -exec chmod 644 {} \;
}
