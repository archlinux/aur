# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hlsdl-bin
pkgver=1.4.8
pkgrel=1
epoch=
pkgdesc="A golang library to help you download a m3u8 file and save it as a single TS file"
arch=(x86_64)
url="https://github.com/canhlinh/hlsdl"
license=('GPL3')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(hlsdl)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/canhlinh/hlsdl/releases/download/$pkgver/hlsdl_linux")
noextract=()
sha256sums=('74afcb48209b5416c3c706a33c792a84f9b500fd9a3c8b3151a022d204ffac04')
validpgpkeys=()

package() {
	install -Dm755 hlsdl* $pkgdir/usr/bin/hlsdl
}
