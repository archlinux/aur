# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=ytmenu-git
pkgver=1.4.1
pkgrel=1
epoch=
pkgdesc="A posix script to find and watch youtube videos from the terminal. "
arch=(any)
url="https://github.com/demonkingswarn/ytmenu"
license=('GPL3')
groups=()
depends=(mpv fzf yt-dlp)
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

pkgver() {
	cd "${_pkgname}"
	printf "1.4_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
		rm -rf ytmenu
        curl -sL "https://github.com/DemonKingSwarn/ytmenu/raw/main/ytmenu" -o ~/.local/bin/ytmenu
		chmod +x ~/.local/bin/ytmenu
}

