pkgname="bbdown-bin"
pkgver="1.5.4"
pkgrel="1"
_uploaddate="20221019"
pkgdesc="一款命令行式哔哩哔哩下载器. Bilibili Downloader."
arch=("x86_64" "aarch64")
url="https://github.com/nilaoda/BBDown"
license=('MIT')
depends=("zlib" "gcc-libs" "ffmpeg")
provides=("bbdown")
conflicts=("bbdown")
source_x86_64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-x64.zip")
md5sums_x86_64=("a559010e199c91c2080e118cd91af18e")
source_aarch64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-arm64.zip")
md5sums_aarch64=("dd199b3791af8a8069291d603a587539")

build() {
	chmod +x BBDown
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp BBDown "$pkgdir/usr/bin"
}
