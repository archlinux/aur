# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=otpauth-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Google Authenticator migration decoder"
arch=('x86_64')
url="https://github.com/dim13/otpauth"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/otpauth-v${pkgver}-linux-amd64.tgz")
sha256sums_x86_64=('d77f3b6d0ebca23005313c310ca03adf25cffd9645a56b5002740d926ffba6c3')

package() {
  install -Dm755 "otpauth" "${pkgdir}/usr/bin/otpauth"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
