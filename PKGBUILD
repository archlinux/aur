pkgname=vita-presence-rs-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Discord Rich Presence client for the PS Vita VitaPresence plugin"
arch=('x86_64')
url="https://github.com/krypt0graphy/vita-presence-rs"
license=('GPL-3.0-or-later')
provides=('vita-presence-rs')
conflicts=('vita-presence-rs')
source=("vita-presence-rs-linux::https://github.com/krypt0graphy/vita-presence-rs/releases/download/v${pkgver}/vita-presence-rs-linux")
sha256sums=('a012dfcfc056dd9997714177581f60d1630d6d563c8c7c674a2bcd48f005bc16')

package() {
    install -Dm755 "vita-presence-rs-linux" "$pkgdir/usr/bin/vita-presence-rs"
}