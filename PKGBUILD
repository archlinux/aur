# Maintainer: tobiko461 <aur@skillissue.de>
pkgname=fanbox-dl-bin
pkgver=0.27.2
pkgrel=1
pkgdesc="Pixiv Fanbox Downloader"
arch=('aarch64' 'i386' 'x86_64')
url="https://github.com/hareku/fanbox-dl"
license=('MIT')

source_aarch64=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_arm64.tar.gz")
source_i386=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_i386.tar.gz")
source_x86_64=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_x86_64.tar.gz")

sha256sums_aarch64=("e6b9ad3401ff1760796d06b7e21c80685ea3c30cc84df4f8d487e1d41c494d5c")
sha256sums_i386=("5a32b433d1184e3f3f699f89b99e28f425d4bd8a63d524dadab1d4e76c2f4a18")
sha256sums_x86_64=("d95daa9ac155e92ad95a0278f6417eb4888d5c993d19dc90d23a1912a5c04782")

package() {
	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
