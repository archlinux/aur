# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: aquanjsw <zhdlcc@gmail.com>
pkgname=bluetooth-auto-reconnect
pkgver=1.0.0
pkgrel=3
epoch=0
pkgdesc="Auto reconnect bluetooth devices on resume from system suspend"
arch=(any)
url="https://aur.archlinux.org/packages/bluetooth-auto-reconnect"
license=('GPL-1.0-or-later')
groups=()
depends=(bash bluez-utils)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(bluetooth-auto-reconnect.sh)
noextract=()
sha256sums=(e93df3dc7dbbdb68e6f74272c75be3ac2fdccb3f98215277cbd9d2cc720f1f97)
            
validpgpkeys=()

package() {
    install -Dm755 bluetooth-auto-reconnect.sh "$pkgdir/usr/lib/systemd/system-sleep/bluetooth-auto-reconnect.sh"
}
