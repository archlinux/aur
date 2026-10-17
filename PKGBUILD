# Maintainer: Henriklmao
pkgname=display-tui-bin
pkgver=0.9.6.3
pkgrel=1
pkgdesc="Minimalistic Hyprland monitor configuration TUI (pre-built binary)"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('display-tui')
conflicts=('display-tui')
options=('!strip' '!lto')
source=(
  "display-tui-v0.9.6-3-x86_64-unknown-linux-gnu::https://github.com/Henriklmao/display-tui/releases/download/v0.9.6-3/display-tui-v0.9.6-3-x86_64-unknown-linux-gnu"
  "https://raw.githubusercontent.com/Henriklmao/display-tui/v0.9.6-3/assets/display-tui.desktop"
  "https://raw.githubusercontent.com/Henriklmao/display-tui/v0.9.6-3/assets/desktop-icon.png"
)
sha256sums=(
  '7cb21cc4eb23a6eb7a792836073d5ea82b1689390edfaa9cd5690705c29f90e2'
  '97ae3da9e1c0b505846c33615e6c3808cf021e0f28cbda3d9aafa4140d863034'
  '928f22dd38c67efd985d53fa73c73b490b06625bf99e35c6fd434f8e7d9aad52'
)

package() {
  install -Dm755 "display-tui-v0.9.6-3-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/display-tui"
  install -Dm644 display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
