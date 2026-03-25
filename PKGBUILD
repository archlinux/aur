pkgname=linux-tool-bin
pkgver=0.2.2
pkgrel=2
pkgdesc="AUR and Pacman package manager helper with Slint UI"
arch=('x86_64')
url="https://github.com/Enzo415611/linux-tool"
license=('MIT')
depends=('glibc')

source=("https://github.com/Enzo415611/linux-tool/releases/download/v$pkgver/linux-tool"
        "https://raw.githubusercontent.com/Enzo415611/linux-tool/main/ui/assets/app-icon.png"
        "linux-tool.desktop")

sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 linux-tool "$pkgdir/usr/bin/linux-tool"

  install -Dm644 app-icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/linux-tool.png"

  install -Dm644 linux-tool.desktop \
    "$pkgdir/usr/share/applications/linux-tool.desktop"
}
