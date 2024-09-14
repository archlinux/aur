# Maintainer: tobiko461 <aur@skillissue.de>
pkgname=fanbox-dl-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Pixiv Fanbox Downloader"
arch=('aarch64' 'i386' 'x86_64')
url="https://github.com/hareku/fanbox-dl"
license=('MIT')

source=("https://raw.githubusercontent.com/hareku/fanbox-dl/v$pkgver/README.md" "https://raw.githubusercontent.com/hareku/fanbox-dl/v$pkgver/LICENSE")
source_aarch64=("${pkgname%-bin}::https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_Linux_arm64")
source_i386=("${pkgname%-bin}::https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_Linux_i386")
source_x86_64=("${pkgname%-bin}::https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_Linux_x86_64")

sha256sums=(SKIP SKIP)
sha256sums_aarch64=("9559fc9d119eafd8ed70d1176461306720642f308c0f1aff789e53af6dfdd490")
sha256sums_i386=("8592d60922c1f52c46e73f3f042d7fd51078a7b6bb8a4cb7daadd6b347b007e4")
sha256sums_x86_64=("8b554d136e2aecec59b1221cd43de3aef38bd30724ef44cfc87e4a34a1229e84")

package() {
	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
