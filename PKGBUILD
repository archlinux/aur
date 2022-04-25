# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=dfetch
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Yet another fetching tool. "
arch=(any)
url="https://github.com/demonkingswarn/scripts"
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
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
		rm -rf scripts
        curl -sL "https://github.com/DemonKingSwarn/dotfiles-3/raw/main/.local/bin/dfetch" -o ~/.local/bin/dfetch
		chmod +x ~/.local/bin/dfetch
}

