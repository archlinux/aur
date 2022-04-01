# Maintainer: Slips slipfox_xyz@riseup.net>
pkgname=clementeyene
pkgver=1.3.1
pkgrel=2
epoch=
pkgdesc="simple bash script that gets Clementine Music Player status over dbus"
arch=('i386' 'x86_64')
url="https://git.envs.net/Slips/clementeyene"
license=('GPL3')
groups=()
depends=('clementine' 'dbus' 'gawk' 'sed')
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
source=("https://github.com/Slips-PC/clementeyene/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
noextract=()
sha256sums=("375ac39f1a96df1268f011b24d2b5139e3b89e1a425fe664a29f8338740b9f48")
validpgpkeys=()

package() {
	install -Dm755 "clementeyene" ${pkgdir}/usr/bin/clementeyene
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
