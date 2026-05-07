pkgname=vita-presence-rs-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Discord Rich Presence client for the PS Vita VitaPresence plugin"
arch=('x86_64')
url="https://github.com/krypt0graphy/vita-presence-rs"
license=('GPL-3.0-or-later')
provides=('vita-presence-rs')
conflicts=('vita-presence-rs')
source=("vita-presence-rs-linux::https://github.com/krypt0graphy/vita-presence-rs/releases/download/v${pkgver}/vita-presence-rs-linux")
sha256sums=('03d75e4b1555ff8721d3e719410c2ca802e3626062e7a8819c43590914754b1e')

package() {
    install -Dm755 "vita-presence-rs-linux" "$pkgdir/usr/bin/vita-presence-rs"
}