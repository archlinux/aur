
# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=youtty
pkgver=0.3.7
pkgrel=1
pkgdesc="Search, download and watch any youtube video from the tty"
arch=('any')
url="https://github.com/Dvd-Znf/youtty"
license=('GPL3')
groups=()
depends=("python" "yt-dlp" "vlc" "python-requests")
makedepends=("make" "gcc")
source=("https://github.com/Dvd-Znf/youtty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("3934a9b7db0ca1c52c6226b0435f1229f3048839c77ebeceac3c20532f4f6084")

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	cd "$pkgname-$pkgver"
	./install.sh
}

