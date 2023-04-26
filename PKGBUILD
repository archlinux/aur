# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Asuka Minato <youremail@domain.com>
pkgname=form-bin
pkgver=4.3.1
pkgrel=1
epoch=
pkgdesc="The FORM project for symbolic manipulation of very big expressions"
arch=(x86_64)
url="https://www.nikhef.nl/~form/"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(form tform)
conflicts=(form-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/vermaseren/form/releases/download/v${pkgver}/form-${pkgver}-${CARCH}-linux.tar.gz"
        )
noextract=()
sha256sums=('7af2edb16a2bd1a929ee0ccfd9af7e27b8ab7be3ed0f7bf0f9be04dc792ecd17')
validpgpkeys=()

package() {
	cd form-${pkgver}-${CARCH}-linux
	install -Dm755 form tform -t "$pkgdir"/usr/bin
}
