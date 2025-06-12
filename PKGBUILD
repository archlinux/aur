pkgname=royal-blocks
pkgver=1.1.2
pkgrel=1
options=(!debug strip)
pkgdesc="A homemade Royal Tetris in C++"
arch=('x86_64')
url="https://github.com/ulb-info2-group5/Royal-Blocks"
license=('GPL3')
depends=('qt5-base')
makedepends=('gcc' 'make' 'cmake' 'qt5-base')
source=("https://github.com/ulb-info2-group5/Royal-Blocks/releases/download/v1.1.2/royal-blocks-1.1.2-x86_64.pkg.tar.zst")
sha256sums=('e94ad52cfa4087fb2d1a5287725a02d129af6148d6723771a78c4d1f833f028a')

build() { 
  make
}

package() {
  install -Dm755 "royal-blocks-gui" "$pkgdir/usr/bin/royal-blocks"
  install -Dm755 "royal-blocks-tui" "$pkgdir/usr/bin/royal-blocks-tui"
  install -Dm755 "royal-blocks-server" "$pkgdir/usr/bin/royal-blocks-server"

  install -Dm644 "res/royal-blocks.desktop" "$pkgdir/usr/share/applications/royal-blocks.desktop"
  install -Dm644 "res/royal-blocks-tui.desktop" "$pkgdir/usr/share/applications/royal-blocks-tui.desktop"
  install -Dm644 "res/royal-blocks-server.desktop" "$pkgdir/usr/share/applications/royal-blocks-server.desktop"

  install -Dm644 "res/logo_1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/royal-blocks.png"
  install -Dm644 "res/logo_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/royal-blocks.png"
  install -Dm644 "res/logo_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/royal-blocks.png"
  install -Dm644 "res/logo_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/royal-blocks.png"
  install -Dm644 "res/logo_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/royal-blocks.png"
  install -Dm644 "res/logo_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/royal-blocks.png"
  install -Dm644 "res/logo_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/royal-blocks.png"
}
