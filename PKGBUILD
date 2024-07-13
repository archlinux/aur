# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten-bin
pkgver=0.2.0
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

sha256sums_x86_64=('a8cd7a9c53a88b7fe07c97d4a0a338365fdb44fe3e0fe7482bd57781b897100e')
sha256sums_i686=('17124e436539aa162747ae9ae5cb63d6e5b7bf2fd9dec18c0fb3c19d3ce0d795')
sha256sums_armv7h=('cf8b128e0bae9074d94a9a12cb53f8840d47045d6fe8efca74232b2c0013fe0c')
sha256sums_aarch64=('71daaf891b6e3ec6cc80f579bc8136e872e99ddd91753603a7ff3d49d8b1d14f')
