pkgname=vita-presence-rs-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Discord Rich Presence client for the PS Vita VitaPresence plugin"
arch=('x86_64')
url="https://github.com/krypt0graphy/vita-presence-rs"
license=('GPL-3.0-or-later')
provides=('vita-presence-rs')
conflicts=('vita-presence-rs')
source=("vita-presence-rs-linux::https://github.com/krypt0graphy/vita-presence-rs/releases/download/v${pkgver}/vita-presence-rs-linux")
sha256sums=('e12b571950d25ea4cac9a412292f1a21b1423ac10ce81da0b556d98749060bad')

package() {
    install -Dm755 "vita-presence-rs-linux" "$pkgdir/usr/bin/vita-presence-rs"
}