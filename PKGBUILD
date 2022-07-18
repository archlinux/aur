pkgname="bbdown-bin"
pkgver="1.5.3"
pkgrel="1"
_uploaddate="20220514"
pkgdesc="一款命令行式哔哩哔哩下载器. Bilibili Downloader."
arch=("x86_64")
url="https://github.com/nilaoda/BBDown"
license=('MIT')
depends=("zlib" "gcc-libs")
makedepends=()
optdepends=("ffmpeg: 混流用")
provides=("bbdown")
source=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-x64.zip")
md5sums=("792390a9c29edc389790051c7990dcc2")

build() {
	chmod +x BBDown
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp BBDown "$pkgdir/usr/bin"
}
