# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=granted-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Granted is a command line interface (CLI) tool which simplifies access to cloud roles and allows multiple cloud accounts to be opened in your web browser simultaneously."
arch=('x86_64')
url="https://granted.dev/"
license=('MIT')
source=("https://releases.commonfate.io/granted/v${pkgver}/granted_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('86889bf81c036ba058bf02503d53c3295d546e3ed6131128dd1af47c3f7f46d7')

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	install -D ${srcdir}/{granted,assume{,.fish,go}} "${pkgdir}/usr/bin/"
}
