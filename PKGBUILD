# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=granted-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Granted is a command line interface (CLI) tool which simplifies access to cloud roles and allows multiple cloud accounts to be opened in your web browser simultaneously."
arch=('x86_64')
url="https://granted.dev/"
license=('MIT')
source=("https://releases.commonfate.io/granted/v${pkgver}/granted_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('3398ffd1769216c6162acd7f94e585c0b3d1a1ac79dbd119a373a4f911b45780')

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	install -D ${srcdir}/{granted,assume{,.fish,go}} "${pkgdir}/usr/bin/"
}
