# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten-bin
pkgver=0.2.3
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

sha256sums_x86_64=('77c16aa0aefaea96ca569da4c69d4d1a11333e65ed6f9345a653412257bde91f')
sha256sums_i686=('194f5e6dd2ba045855cd06f53a63c2cc13b86965884c84c6ba9081b14b742493')
sha256sums_armv7h=('5c6aaa66a3da29ff44baaac5bb9b48748de133ca8f3192b3bac58af3a0ade59e')
sha256sums_aarch64=('a20ba37641ce24bdaea1cf23b04a91d784ec9127180c7db731ee323fe8a1c6fa')
