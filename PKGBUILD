# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=tdl-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="A Telegram downloader/tools written in Golang"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/iyear/tdl"
license=("GPL3")
depends=()
provides=("tdl")

source_x86_64=("$pkgname-x86_64::https://github.com/iyear/tdl/releases/download/v$pkgver/tdl_Linux_64bit.tar.gz")
source_aarch64=("$pkgname-aarch64::https://github.com/iyear/tdl/releases/download/v$pkgver/tdl_Linux_arm64.tar.gz")
source_armv7h=("$pkgname-armv7h::https://github.com/iyear/tdl/releases/download/v$pkgver/tdl_Linux_armv7.tar.gz")

sha256sums_x86_64=('c1e5728dbb9f9b8f399c6e5aaa3cbdf9140342d017dc70f13d89c69f7daf5a42')
sha256sums_aarch64=('ee74c692edbfe7091815de70d8ded6a3b6089d0101a69c22268ea0b8af4c26a9')
sha256sums_armv7h=('568f584a550272c74d97a865b2ad162352ca8257f826873d44e635b49080bb37')

package() {
	cd "$srcdir/"
	install -Dm755 tdl -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

