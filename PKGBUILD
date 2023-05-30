pkgname="bbdown-bin"
pkgver="1.5.7"
pkgrel="1"
_uploaddate="20230530"
pkgdesc="一款命令行式哔哩哔哩下载器. Bilibili Downloader."
arch=("x86_64" "aarch64")
url="https://github.com/nilaoda/BBDown"
license=('MIT')
depends=("zlib" "gcc-libs" "ffmpeg")
provides=("bbdown")
conflicts=("bbdown")
source_x86_64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-x64.zip")
md5sums_x86_64=("f5b9ff455ce063548ba5443fa283d78f")
source_aarch64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-arm64.zip")
md5sums_aarch64=("21a870baf18e0bf458aea66da54c9592")

build() {
	chmod +x BBDown
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp BBDown "$pkgdir/usr/bin"
}
