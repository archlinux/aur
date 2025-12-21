# Maintainer: Lncvrt <lncvrtreal@gmail.com>
pkgname=lncvrt-games-launcher
pkgver=1.0.2
pkgrel=1
pkgdesc="The official Lncvrt Games Launcher AUR Package!"
arch=('x86_64')
url="https://games.lncvrt.xyz"
source=(
    "https://archive.org/download/lncvrt-games-launcher/Lncvrt-Games-Launcher-${pkgver}-linux.AppImage"
    'lncvrt-games-launcher.desktop'
    '32x32.png'
    '128x128.png'
    '256x256@2.png'
)
sha256sums=(
    '2fc50482cd7273821005bb803a4068c6fbf18728a6bc3869bfe8c8826f16292e'    
    '773748b6ee35da1c11e47024dc222a2b5c43e97626ec649adbb0d87729dbcf3d'
    'c40be4e50bca8c58fa0114aec50e62dc85b8747cd0c61ed7b464e3b5d1ae1bd5'
    'd5272d77054a9a3f010760bf8ff78babf59eaecd31e5f695f5a7156d34252219'
    '6e812d3fcdce162d740fb7f4a0ad0a2c4b2485103b9569ed8062b952a9445c4f'
)
options=('!strip')
package() {
  install -Dm755 \
    "$srcdir/Lncvrt-Games-Launcher-${pkgver}-linux.AppImage" \
    "$pkgdir/usr/bin/lncvrt-games-launcher"


  install -Dm644 \
    "$srcdir/lncvrt-games-launcher.desktop" \
    "$pkgdir/usr/share/applications/lncvrt-games-launcher.desktop"


  install -Dm644 \
    "$srcdir/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/lncvrt-games-launcher-loader.png"

  install -Dm644 \
    "$srcdir/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/lncvrt-games-launcher-loader.png"

  install -Dm644 \
    "$srcdir/256x256@2.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/lncvrt-games-launcher-loader.png"
}
