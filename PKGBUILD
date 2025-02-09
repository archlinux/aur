
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

pkgver=2.0.r39.g7690c19 # git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
_commit=7690c191e85d505bc0aab512992ed2889a10659d
_commit_sha256=4a729c03c619630f14f43866241731424e6fd3b0323041fb59aa7f3331f6af0c

# Static content

pkgname=phantom-player-git
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://www.phantom-player.com"
license=('GPLv3')
groups=()
depends=("gtk3" "python" "python-cairo" "python-pillow" "python-magic" "python-vlc")
makedepends=("git")
checkdepends=()
optdepends=()
provides=("phantom-player")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/rsm-gh/phantom-player/archive/${_commit}.zip")
noextract=()
sha256sums=("${_commit_sha256}")
validpgpkeys=()

package() {
	cd "phantom-player-${_commit}"
	ls -la
	cp -r ./usr "$pkgdir" 
}
