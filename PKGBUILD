# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=0.4.1

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
sha256sums=('dcb96179a0748a96a44ab0e9b3da508825fe70acf457277d3aff5130335d9d35')

package() {
  install -Dm755 "${srcdir}/${_binname}-linux" "${pkgdir}/usr/bin/${_binname}"
}
