
# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=youtty
pkgver=0.3.9
pkgrel=1
pkgdesc="Search, download and watch any youtube video from the tty"
arch=('any')
url="https://github.com/Dvd-Znf/youtty"
license=('GPL3')
groups=()
depends=("python" "yt-dlp" "vlc" "python-requests")
makedepends=("make" "gcc")
source=("https://github.com/Dvd-Znf/youtty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("99a305d7e3fb7ad622bd744a1d83aa4988ecb6f0a67ab0a73a3d1a644bda8683")

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	cd "$pkgname-$pkgver"
	./install.sh
}
