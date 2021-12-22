# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Slips slipfox_xyz@riseup.net>
pkgname=clementeyene
pkgver=1.1.0
pkgrel=1
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
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 "clementeyene" ${pkgdir}/usr/bin/clementeyene
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
