# Maintainer: Your Name <you@example.com>
pkgname=marcwel-archive
pkgver=0.69.420
pkgrel=1
pkgdesc="Makes files larger"
arch=('x86_64')
url="https://github.com/ShortWare/marcwel-archive"
license=('Beerware')
depends=('nodejs')
source=('marcwel.js')
sha256sums=('SKIP') # Use real hash if uploading to AUR

package() {
  install -Dm755 "$srcdir/marcwel.js" "$pkgdir/usr/bin/marcwel"
}
