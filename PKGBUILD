pkgname=marcwel-archive
pkgver=2.69.420
pkgrel=1
pkgdesc="The revolutionary archiving software that boldly asks, “What if… bigger is better?”"
arch=('x86_64')
url="https://github.com/ShortWare/marcwel-archive"
license=('Beerware')
depends=('nodejs')
source=('marcwel.js' 'marcwel.desktop' 'icon.png')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/marcwel.js" "$pkgdir/usr/bin/marcwel"
  install -Dm644 "$srcdir/marcwel.desktop" "$pkgdir/usr/share/applications/marcwel.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/marcwel-archive.png"
}

