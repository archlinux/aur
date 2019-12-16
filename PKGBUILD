# Maintainer: German Lashevich <german.lashevich@gmail.com>

_binname=totp

pkgname=rustotpony-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.6
pkgrel=1
pkgdesc='RusTOTPony — CLI manager of one-time password generators aka Google Authenticator'
provides=(${_binname})
conflicts=(${_pkgname} ${_pkgname}-git)
arch=(x86_64)
url="https://github.com/zebradil/${_pkgname}"
license=('MIT')
source=("${url}/releases/download/${pkgver}/${_binname}-linux")
# source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_${_arch}.tgz")
sha256sums=("7fd4c34398a63dcf3189db91ba2dbe9c1d8b96a0a04814ef56b8e764b145e608")

package() {
  install -Dm755 "${srcdir}/${_binname}-linux" "${pkgdir}/usr/bin/${_binname}"
}
