# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Stay informed without leaving your command line"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/zMoooooritz/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_armv7h=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

package() {
	# cd "${pkgname%-bin}-$pkgver"
	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}

sha256sums_x86_64=('977dae24fdf84d6e2c91b6e7d66970228231d178969effb164688ced12d90748')
sha256sums_i686=('33e25f9a3e0ff0f7555f764cfa8cae9287909232cbfe1f202b658bcf4b5fb05b')
sha256sums_armv7h=('50678023c14d0822b1a04a03f40c9d5b958ba6367be2d597196419d9d14d2965')
sha256sums_aarch64=('d53aa1549004d728f903f7d744a3d08f3089bcfca234887bcc269635953a3a50')
