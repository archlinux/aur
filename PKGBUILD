# Maintainer: Luke Street <luke.street@encounterpc.com>

pkgname=detex-thumbnailer
pkgver=1.0.0
pkgrel=1
pkgdesc="Thumbnailer for DDS (DirectDraw Surface) and KTX (Khronos Texture) files supporting BC7, ETC1, ETC2 & more"
arch=(x86_64)
url="https://github.com/inequation/detex"
license=('ISC')
depends=('detex-convert' 'xdg-utils' 'gdk-pixbuf2')
source=('detex.thumbnailer' 'detex-thumbnailer')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/detex-thumbnailer" \
    "$pkgdir/usr/bin/detex-thumbnailer"
  install -Dm644 "$srcdir/detex.thumbnailer" \
    "$pkgdir/usr/share/thumbnailers/detex.thumbnailer"
}

# vim:set ts=2 sw=2 et:
