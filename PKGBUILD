# Maintainer: mrkirill046 <contact@qwy-games.ru>
pkgname=dynamic-drpc-hyprland-bin 
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows"
arch=('x86_64')
url="https://github.com/mrkirill046/discord-dynamic-status-hyprland"
license=('MIT')
depends=()
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/discord-dynamic-status-hyprland")
sha256sums_x86_64=('eb95a01b560523ae6b003e59d4d19d37a8188eda5624a534a9843058b5c23158')

package() {
    install -Dm755 "discord-dynamic-status-hyprland" "$pkgdir/usr/bin/dynamic-drpc-hyprland"
}

