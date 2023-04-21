# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>
pkgname=pnket
pkgver=0.2.2
pkgrel=1
pkgdesc="A download manager"
arch=("x86_64")
url="https://github.com/Ablaze-MIRAI/pnket"
license=('MIT')
source=("https://github.com/Ablaze-MIRAI/pnket/releases/download/v0.2.2/pnket")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
