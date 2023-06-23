pkgname="bbdown-bin"
pkgver="1.5.9"
pkgrel="1"
_uploaddate="20230622"
pkgdesc="一款命令行式哔哩哔哩下载器. Bilibili Downloader."
arch=("x86_64" "aarch64")
url="https://github.com/nilaoda/BBDown"
license=('MIT')
depends=("zlib" "gcc-libs" "ffmpeg")
provides=("bbdown")
conflicts=("bbdown")
source_x86_64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-x64.zip")
md5sums_x86_64=("bf10ac7888d53d4bd96fbdd70ba65ef6")
source_aarch64=("https://github.com/nilaoda/BBDown/releases/download/${pkgver}/BBDown_${pkgver}_${_uploaddate}_linux-arm64.zip")
md5sums_aarch64=("f15325c5ce45bab9985c3886ac926ced")

build() {
	chmod +x BBDown
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp BBDown "$pkgdir/usr/bin"
}
