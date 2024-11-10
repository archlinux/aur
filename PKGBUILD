# Maintainer: tobiko461 <aur@skillissue.de>
pkgname=fanbox-dl-bin
pkgver=0.26.2
pkgrel=1
pkgdesc="Pixiv Fanbox Downloader"
arch=('aarch64' 'i386' 'x86_64')
url="https://github.com/hareku/fanbox-dl"
license=('MIT')

source_aarch64=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_arm64.tar.gz")
source_i386=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_i386.tar.gz")
source_x86_64=("https://github.com/hareku/${pkgname%-bin}/releases/download/v$pkgver/fanbox-dl_Linux_x86_64.tar.gz")

sha256sums_aarch64=("fd9a6e67c310567bac8203575d9dc7251e91e5c0d2e65820ce9935db33b5d8c0")
sha256sums_i386=("1982cc8cd30ad198b00d5ac8bf5e51c4aac9854312d03a37dbcf2fa3e8952d07")
sha256sums_x86_64=("8ddca3e12d8209f604cb1caa7f3404af6bba4ebc7dec8b426227f3def27dd6cf")

package() {
	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
