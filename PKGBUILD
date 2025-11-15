
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

pkgname=phantom-player
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://phantom-player.rsm92.fr"
license=('GPLv3')
groups=()
depends=("gtk3" "python" "python-cairo" "python-pillow" "python-magic" "python-send2trash" "python-vlc")
makedepends=("git")
checkdepends=()
optdepends=()
provides=("phantom-player")
conflicts=("phantom-player")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeberg.org/rsm92/phantom-player/archive/v2.0.1.zip")
noextract=()
sha256sums=('2b67587300109a51d7a680d430f63d5ec80d4c98c98b972ddfa706435a1c2ce5')
validpgpkeys=()

package() {
	cd "phantom-player"
	ls -la
	cp -r ./usr "$pkgdir" 
}
