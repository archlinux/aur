
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

pkgver=2.0.r46.gcdccc02 # git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
_commit=cdccc022e1f99fb74d762a804aca2295c6b0a335
_commit_sha256=78a23e53dc5a5846308f9df502a2d353ec233e79eb777d09b786315761e345c0

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
