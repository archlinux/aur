# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui
pkgver=1.5
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files."
source=("git+https://github.com/JaGoLi/ytdl-gui.git")
install="youtubedl-gui.install"
md5sums=('SKIP')
makedepends=("git")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme"
	 "gtk-update-icon-cache")

build() {
	cd ytdl-gui
	make build
}

package() {
	cd ytdl-gui
	make DESTDIR="$pkgdir/" install
}
