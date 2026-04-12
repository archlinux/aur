pkgname=vita-presence-rs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Discord Rich Presence client for the PS Vita VitaPresence plugin"
arch=('x86_64')
url="https://github.com/krypt0graphy/vita-presence-rs"
license=('GPL-3.0-or-later')
provides=('vita-presence-rs')
conflicts=('vita-presence-rs')
source=("vita-presence-rs-linux::https://github.com/krypt0graphy/vita-presence-rs/releases/download/v${pkgver}/vita-presence-rs-linux")
sha256sums=('5000a06dda5a65917454931e40ed3d3f1de480d69b7f63981fa630b22265c44b')

package() {
    install -Dm755 "vita-presence-rs-linux" "$pkgdir/usr/bin/vita-presence-rs"
}