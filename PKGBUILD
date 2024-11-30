# Maintainer: tobiko461 <aur@skillissue.de>
pkgname=fanbox-dl-bin
pkgver=0.27.1
pkgrel=1
pkgdesc="Pixiv Fanbox Downloader"
arch=('aarch64' 'i386' 'x86_64')
url="https://github.com/hareku/fanbox-dl"
license=('MIT')

source_aarch64=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_arm64.tar.gz")
source_i386=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_i386.tar.gz")
source_x86_64=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_x86_64.tar.gz")

sha256sums_aarch64=("2f439d20f1163a6d99427d33d8c9ef47cc7cdfb8e6d989d01999610f9fac6c5b")
sha256sums_i386=("b26aca86b5a82820deea39e785e7de90eca741deeef3c44a9344910bf69afe0f")
sha256sums_x86_64=("56cddd6f607bb0771602ccf26cf0139b8ee71732761782ea15acc8c02e8698d5")

package() {
	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
