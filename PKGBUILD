# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=ytmenu
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="A posix script to find and watch youtube videos from the terminal. "
arch=(any)
url="https://github.com/demonkingswarn/ytmenu"
license=('GPL3')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(ytmenu)
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
		rm -rf ytmenu
        wget https://github.com/DemonKingSwarn/ytmenu/raw/main/ytmenu
		doas cp ytmenu $HOME/.local/bin/
}

