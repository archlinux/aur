# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeff Wright <jeff@teamjk.page>
pkgname=nobeep
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Blacklists the pcspkr kernel module"
arch=('any')
url=""
license=('GPL')
groups=()
depends=()
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
source=("nobeep.conf")
noextract=()
validpgpkeys=()

package() {
	mkdir --parents $pkgdir/etc/modprobe.d
	cp nobeep.conf $pkgdir/etc/modprobe.d/nobeep.conf
}
md5sums=('3866086e6af5e3528a66eff492f2f4dd')
