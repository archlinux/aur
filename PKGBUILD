# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=youtty
pkgver=0.4.2
pkgrel=1
pkgdesc="Search, download and watch any youtube video from the tty"
arch=('any')
url="https://github.com/Dvd-Znf/youtty"
license=('GPL3')
groups=()
depends=("python" "yt-dlp" "vlc" "python-requests")
makedepends=("make" "gcc")
source=("https://github.com/Dvd-Znf/youtty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("43f5a065e63fbbc5c4ce0e463b6b924b9e444be6e4c177d2cf1039a8d7ca165e")

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	cd "$pkgname-$pkgver"
	make install
}

