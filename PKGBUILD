pkgname=vita-presence-rs-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Discord Rich Presence client for the PS Vita VitaPresence plugin"
arch=('x86_64')
url="https://github.com/krypt0graphy/vita-presence-rs"
license=('GPL-3.0-or-later')
provides=('vita-presence-rs')
conflicts=('vita-presence-rs')
source=("vita-presence-rs-linux::https://github.com/krypt0graphy/vita-presence-rs/releases/download/v${pkgver}/vita-presence-rs-linux")
sha256sums=('8aafaafe4f1e1cda28d2505cb39d45f2e829beeb268d72eedfe0906fb8a8bae4')

package() {
    install -Dm755 "vita-presence-rs-linux" "$pkgdir/usr/bin/vita-presence-rs"
}