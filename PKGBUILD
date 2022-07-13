# Maintainer: Frank Bearoff fbearoff at gmail dot com
pkgname='win32yank-bin'
pkgver='0.0.4'
pkgrel=1
arch=('x86_64')
url="https://github.com/equalsraf/${pkgname%-bin}"
pkgdesc='A clipboard tool for Windows'
license=('ISC')
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-x64.zip")
sha512sums=('782384302bd456b0dd3e422bbb53b88d2ffda0cb423d942a669a348f9fcb22c8e2141952e69b7260d736e8c275c504f0e5816268644452f892a2c716f5e53776')

package() {
  install -Dm755 "${pkgname%-bin}.exe" "${pkgdir}/usr/bin/${pkgname%-bin}.exe"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
