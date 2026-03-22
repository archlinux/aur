# Maintainer: insayd Cyan <insadamt@github>
pkgname=mpwall
pkgver=1.0.5
pkgrel=1
pkgdesc="A professional hybrid CLI/TUI live video wallpaper manager for Hyprland/Wayland"
arch=('x86_64')
url="https://github.com/Lamess-UI/mpwall"
license=('MIT')
depends=('mpvpaper' 'gawk')
provides=('mpwall')
source=(
    "mpwall-x86_64::https://github.com/Lamess-UI/mpwall/releases/download/v$pkgver/mpwall-x86_64"
    "LICENSE::https://raw.githubusercontent.com/Lamess-UI/mpwall/v$pkgver/LICENSE"
)
sha256sums=(
    '8077d97e03c34723af5fc61ee18147bf61b1efd86e3c3e13c94786bbfb7fd1ae'
    '4a9ab123aa0abfa1dcb6d65b38ceefd7b8bf119cd97c7b710afb48c67eda5f0b'
)

package() {
    install -Dm755 "$srcdir/mpwall-x86_64" "$pkgdir/usr/bin/mpwall"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

