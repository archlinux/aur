pkgname="bbdown-bin"
pkgver="1.6.3"
pkgrel="1"
_uploaddate="20240814"
pkgdesc="一款命令行式哔哩哔哩下载器. Bilibili Downloader."
arch=("x86_64" "aarch64")
url="https://github.com/nilaoda/BBDown"
license=('MIT')
depends=("zlib" "gcc-libs" "ffmpeg")
provides=("bbdown")
conflicts=("bbdown")
source_x86_64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-x64.zip")
md5sums_x86_64=("785bd74f17109ea4666c00bf59cf9f03")
source_aarch64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-arm64.zip")
md5sums_aarch64=("b221e9eed365e23a751b0d37ba0a291a")

build() {
	chmod +x BBDown
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp BBDown "$pkgdir/usr/bin"
}
