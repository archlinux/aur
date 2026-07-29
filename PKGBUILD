# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=dynamic-drpc-wayland-bin 
pkgver=2.0.2
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland / Niri windows"
arch=('x86_64')
url="https://github.com/mrkirill046/discord-dynamic-status-wayland"
license=('MIT')
depends=()
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/discord-dynamic-status-wayland")
sha256sums_x86_64=('sha256:547b557c2452c72b10d15e1e871d399eeea57b51893d853020704963caddeb5c')

package() {
    install -Dm755 "discord-dynamic-status-wayland" "$pkgdir/usr/bin/discord-dynamic-status-wayland"
}

