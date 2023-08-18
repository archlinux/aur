pkgname="bbdown-bin"
pkgver="1.6.1"
pkgrel="1"
_uploaddate="20230817"
pkgdesc="一款命令行式哔哩哔哩下载器. Bilibili Downloader."
arch=("x86_64" "aarch64")
url="https://github.com/nilaoda/BBDown"
license=('MIT')
depends=("zlib" "gcc-libs" "ffmpeg")
provides=("bbdown")
conflicts=("bbdown")
source_x86_64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-x64.zip")
md5sums_x86_64=("5fee55d1eea4e9857a1a118ecbed87fd")
source_aarch64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-arm64.zip")
md5sums_aarch64=("c6b09d20640a70cc4cd63212a67a5792")

build() {
	chmod +x BBDown
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp BBDown "$pkgdir/usr/bin"
}
