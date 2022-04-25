# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=dfetch
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Yet another fetching tool. "
arch=(any)
url=""
license=('GPL3')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dfetch)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.0_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        curl -sL "https://github.com/DemonKingSwarn/dotfiles-3/raw/main/.local/bin/dfetch" -o /usr/local/bin/dfetch
		chmod +x /usr/local/bin/dfetch
}

