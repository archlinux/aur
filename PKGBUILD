pkgname=clip-transfer
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight LAN clipboard/text sharing tool with automatic server/client detection"
arch=('x86_64')
url="https://github.com/Evr5/ClipTransfer"
license=('MIT')
makedepends=('gcc' 'make' 'cmake')
provides=('clip-transfer')
conflicts=('clip-transfer')
source=("https://github.com/Evr5/ClipTransfer/releases/download/v1.1.0/clip-transfert-1.1.0-x86_64.pkg.tar.zst")
sha256sums=('bc5825b115572ba8a9372df1c6a1eced53206dae7743398ee20c417919cd91a9')

build() {
  make
}

package() {
  install -Dm755 "clip-transfer" "$pkgdir/usr/bin/clip-transfer"

  install -Dm644 "res/clip-transfer.desktop" "$pkgdir/usr/share/applications/clip-transfer.desktop"

  install -Dm644 "res/logo_1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/clip-transfer.png"
  install -Dm644 "res/logo_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/clip-transfer.png"
  install -Dm644 "res/logo_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/clip-transfer.png"
  install -Dm644 "res/logo_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/clip-transfer.png"
  install -Dm644 "res/logo_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/clip-transfer.png"
  install -Dm644 "res/logo_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/clip-transfer.png"
  install -Dm644 "res/logo_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/clip-transfer.png"
}
