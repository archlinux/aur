
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

pkgver=2.0.r63.gdb391d6 # git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
_commit=db391d699ea5c34f0c5e9f58684f216a66d10a21
_commit_sha256=11576ed21c124caf9459bc964cb0352acb2288d8328433ad9d4a1d8a0828b6d6

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
