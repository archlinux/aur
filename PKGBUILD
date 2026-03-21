# Maintainer: insayd Cyan <insadamt@github>
pkgname=mpwall
pkgver=1.0.4
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
    '5a3e23b28a7d75c28ee0edd06a9a7c4d2a533af630436f10c12449c2f1aee5d9'
    '4a9ab123aa0abfa1dcb6d65b38ceefd7b8bf119cd97c7b710afb48c67eda5f0b'
)

package() {
    install -Dm755 "$srcdir/mpwall-x86_64" "$pkgdir/usr/bin/mpwall"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

