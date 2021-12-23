# Maintainer: Slips slipfox_xyz@riseup.net>
pkgname=clementeyene
pkgver=1.3.0
pkgrel=3
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
sha256sums=("67703e5ea39d803a832a74bba548d5324efcd04befa16929bb796a8519531765")
validpgpkeys=()

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 "clementeyene" ${pkgdir}/usr/bin/clementeyene
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
