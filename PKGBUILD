# Maintainer: Frank Bearoff fbearoff at gmail dot com
pkgname='win32yank-bin'
pkgver='0.1.1'
pkgrel=1
arch=('x86_64')
url="https://github.com/equalsraf/${pkgname%-bin}"
pkgdesc='A clipboard tool for Windows'
license=('ISC')
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-x64.zip")
sha512sums=('9a8fd2c0a040d492913e792a2fa84a91b0b971034dd56ccec8fe0140809701cd13191842e77343f6105527512a7edcf44a9b72c5a921c837f55c08e25020a957')

package() {
	install -Dm755 "${pkgname%-bin}.exe" "${pkgdir}/usr/bin/${pkgname%-bin}.exe"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
