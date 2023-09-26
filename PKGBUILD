
# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=youtty
pkgver=0.2.1
pkgrel=1
pkgdesc="Search, download and watch any youtube video from the tty"
arch=('any')
url="https://github.com/Dvd-Znf/youtty"
license=('GPL3')
groups=()
depends=("python" "yt-dlp" "vlc")
makedepends=("make" "gcc")
source=("https://github.com/Dvd-Znf/youtty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("60ad38c7555ee9a6e8fe99ee76c1248d192709e4b6852a3d05f909949f42d029")

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	cd "$pkgname-$pkgver"
	./install.sh
}
