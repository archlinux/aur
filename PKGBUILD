# Maintainer : Ainola
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Lars Boettcher lars@newyew.de>

pkgname=csound-doc
pkgver=6.05
pkgrel=1
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
depends=('csound')
source=("http://downloads.sourceforge.net/csound/Csound${pkgver}_manual_html.zip")
sha256sums=('4d9a71a4dc2cee28b7a5d879c3e8d39d98711f813f7b797b9bb6a7c3635235bd')

package() {
  # docs
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  # permissions
  find "$pkgdir" -type f -exec chmod 644 {} \;
}
