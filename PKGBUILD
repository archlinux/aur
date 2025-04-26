
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

pkgver=v2.0.r9.gcf9e6cb # git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
_commit=cf9e6cb8e7a65bd4b14c0bb0fb700f759709b32b
_commit_sha256=2645572aeb3fedc0f3d9c640d1843bf4c71b2c4a92cb4ef4101269d217f847af

# Static content

pkgname=phantom-player-git
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://www.phantom-player.com"
license=('GPLv3')
groups=()
depends=("gtk3" "python" "python-cairo" "python-pillow" "python-magic" "python-send2trash" "python-vlc")
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
