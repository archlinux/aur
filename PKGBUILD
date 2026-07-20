# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=dynamic-drpc-wayland-bin 
pkgver=2.0.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland / Niri windows"
arch=('x86_64')
url="https://github.com/mrkirill046/discord-dynamic-status-wayland"
license=('MIT')
depends=()
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/discord-dynamic-status-wayland")
sha256sums_x86_64=('98ee5435cadee4d559c84451a6defbb531e5cdab72c434fd60e484228c2231ed')

package() {
    install -Dm755 "discord-dynamic-status-wayland" "$pkgdir/usr/bin/discord-dynamic-status-wayland"
}

