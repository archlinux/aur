# Maintainer: Cody P Schafer < aur [at] codyps.com >
pkgname=dir-dlagent
pkgver=1
pkgrel=1
pkgdesc="A makepkg DLAGENT which forwards requests to configured directories"
arch=('any')
url="https://aur.archlinux.org/packages/dir-dlagent"
license=('GPL3')
depends=('bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
install=
options=()

source=(
	dir-dlagent
)
package() {
	install -d -m 0755 "${pkgdir}/usr/bin"
	install -m 755 dir-dlagent "${pkgdir}/usr/bin"
}
sha1sums=('f3728308f955bf748d2e713ba41712cbcf86fb31')
