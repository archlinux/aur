# Maintainer: ffqq <shuttara@gmail.com>
pkgname=liteaur-git
_pkgname=liteaur
pkgver=1.5.1
pkgrel=1
pkgdesc="LiteAUR: The shell script light-weight AUR helper"
arch=('any')
url="https://gitlab.com/TechSour12/liteaur"
license=('GPL3')
depends=('pacman' 'git')
optdepends=('doas' 'sudo')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://gitlab.com/TechSour12/liteaur.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
