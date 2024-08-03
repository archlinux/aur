# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten-bin
pkgver=0.2.2
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

sha256sums_x86_64=('62f7a210ba9be7aa55a10ca6160ecef423778189e090df8554d62fddf232d2fc')
sha256sums_i686=('e7875bb0744adeb3de05db21b317f694925727228cb3822927cf46c9096bebc7')
sha256sums_armv7h=('d2362fb2b2e6d93d8998e82157e571ae2157a7a7206976a941983377e802250d')
sha256sums_aarch64=('cc29c6f8c64ba6a0ad0f45fe66808e92ddfb13cf63a348d897151643ca2e2f2e')
