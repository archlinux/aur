# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=0.4.0

_binname=totp

pkgname=rustotpony-bin
_pkgname=${pkgname%-bin}
pkgrel=1
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
provides=(${_binname})
conflicts=(${_pkgname})
arch=(x86_64)
url="https://github.com/zebradil/${_pkgname}"
license=('MIT')
source=("${url}/releases/download/${pkgver}/${_binname}-linux")
sha256sums=('083163a99d84a6a398fb0c2bca3645c5f66c00603351884897f5c6c38fd743bc')

package() {
  install -Dm755 "${srcdir}/${_binname}-linux" "${pkgdir}/usr/bin/${_binname}"
}
