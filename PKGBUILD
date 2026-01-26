# Maintainer: Lncvrt <lncvrtreal@gmail.com>
pkgname=lncvrt-games-launcher
pkgver=1.0.3
pkgrel=4
pkgdesc="The official Lncvrt Games Launcher AUR Package!"
arch=('x86_64')
depends=('gtk3' 'libx11')
url="https://games.lncvrt.xyz"
source=(
    "https://games-r2.lncvrt.xyz/lncvrt-games-launcher/Lncvrt-Games-Launcher-${pkgver}-linux"
    'lncvrt-games-launcher.desktop'
    '32x32.png'
    '128x128.png'
    '256x256@2.png'
)
sha256sums=(
    'f1aa6a99a72739ca0153fd297a88d276708bc288b617553f2cda140f463c7b80'
    '459c15b6f69f7026963b2090a22a3de3729ae8f54ad23b3c72e8b8a15a937115'
    'c40be4e50bca8c58fa0114aec50e62dc85b8747cd0c61ed7b464e3b5d1ae1bd5'
    'd5272d77054a9a3f010760bf8ff78babf59eaecd31e5f695f5a7156d34252219'
    '6e812d3fcdce162d740fb7f4a0ad0a2c4b2485103b9569ed8062b952a9445c4f'
)
options=('!strip')
package() {
  install -Dm755 \
    "$srcdir/Lncvrt-Games-Launcher-${pkgver}-linux" \
    "$pkgdir/usr/bin/lncvrt-games-launcher-loader"

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
