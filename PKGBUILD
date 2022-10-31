# Maintainer: LINUX-GAMING.RU (tergoevm@gmail.com)

pkgname=portproton
pkgver=1.0
pkgrel=13
pkgdesc="Software for playing Microsoft Windows games and launchers"
arch=('x86_64')
url="https://linux-gaming.ru"
license=('MIT')
depends=('procps-ng' 'bash' 'icoutils' 'yad' 'wget' 'bubblewrap' 'zstd' 'cabextract'
         'bc' 'tar' 'openssl' 'desktop-file-utils' 'curl' 'dbus' 'freetype2' 'xdg-utils'
         'gdk-pixbuf2' 'ttf-font' 'zenity' 'lsb-release' 'nss' 'xorg-xrandr' 'lsof' 'mesa-utils'
         'vulkan-driver' 'vulkan-icd-loader' 'lib32-libgl' 'lib32-gcc-libs' 'vulkan-tools'
         'lib32-libx11' 'lib32-libxss' 'lib32-alsa-plugins' 'lib32-libgpg-error' 'lib32-freetype2'
         'lib32-nss' 'lib32-vulkan-driver' 'lib32-vulkan-icd-loader' 'lib32-openssl' 'lib32-mesa-utils')
optdepends=('gamemode: Support for Feral GameMode'
            'lib32-gamemode: 32-bit support for Feral GameMode')
source=("https://raw.githubusercontent.com/Castro-Fidel/PortWINE/master/portwine_install_script/PortProton_1.0"
        "$pkgname.desktop"
        "$pkgname.png"
        'LICENSE')
sha256sums=('349b16b86bb54bc74b8972725ee0c567e8b45e1fc2d04c0805074e6e56e0a137'
            '7abdcc92de357592043b9db45e1c5913ee4c49a340e6e4d49bb2099893aae24c'
            'b27e5a701555b3cccdba0d902c80888d6b0e6a9ed2fb4ced8dfd915207683975'
            '65d12e4e0be4dd5e58324593563c8c79af42876d63f51225364b968117c6ff4f')

package() {
  install -Dm755 "PortProton_$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
