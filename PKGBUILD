# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com> 
# Luke Smith's build of surf

pkgname=surf-luke-git
pkgver=2.0
pkgrel=1
pkgdesc="Luke's build of the surf web browser "
arch=('any')
url="https://github.com/LukeSmithxyz/surf"
license=('MIT')
depends=('dmenu' 'gtk3' 'gcr' 'webkit2gtk')
optdepends=('mpv' 'youtube-dl')
makedepends=('git')
conflicts=("surf")
source=("git+https://github.com/LukeSmithxyz/surf")
sha256sums=("SKIP")

package() {
	cd "$srcdir/surf"
	sudo make clean install
}
