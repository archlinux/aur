
# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=youtty
pkgver=0.3.5
pkgrel=1
pkgdesc="Search, download and watch any youtube video from the tty"
arch=('any')
url="https://github.com/Dvd-Znf/youtty"
license=('GPL3')
groups=()
depends=("python" "yt-dlp" "vlc" "python-requests")
makedepends=("make" "gcc")
source=("https://github.com/Dvd-Znf/youtty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("8de9fd5682366a3a1129069383c2753d6e93645280495fbfadb777e04b7abbd4")

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	cd "$pkgname-$pkgver"
	./install.sh
}
