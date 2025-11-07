pkgname=marcwel-archive
pkgver=3.69.420
pkgrel=1
pkgdesc="The revolutionary archiving software that boldly asks, “What if… bigger is better?”"
arch=('x86_64')
url="https://github.com/ShortWare/marcwel-archive"
license=('Beerware')
depends=('nodejs')
source=(
  "$url/raw/main/marcwel.js"
  "$url/raw/main/marcwel.desktop"
  "$url/raw/main/icon.jpg"
)
sha256sums=('b339ff7c10f2b0046454ee2caa18fd892e5bb5ae6738552f9a4e8836f3a38b1a'
            'dd4fe833b9ed149706d0631c80f7cd35b7c8979a872e589295dd1fb5bb6e7ae5'
            'bbc6ce0b2ac01c3cc139b8a0e959268e892cb041a7be5c5ea69d5d3bf054c09f')

package() {
  install -Dm755 "$srcdir/marcwel.js" "$pkgdir/usr/bin/marcwel"
  install -Dm644 "$srcdir/marcwel.desktop" "$pkgdir/usr/share/applications/marcwel.desktop"
  install -Dm644 "$srcdir/icon.jpg" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/marcwel-archive.jpg"
}

