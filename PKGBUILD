# Maintainer: thynkon <thynkon at protonmail dot com>

_pkgname="kubeletctl"
pkgname=${_pkgname}-bin
pkgver=1.13
pkgrel=1
pkgdesc="A client for kubelet"
arch=('x86_64')
url="https://github.com/cyberark/kubeletctl"
license=('apache2')
source=(
  ${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64
)
sha512sums=(
  f1d72fc0045f1ff0b900cc924988a597d0a57f319eccc710a2a62e95f2c600cf0254f64812e0453e715694ae90fb9eb55ddc7573564f9c92ada60f01280bfcba
)
_filename="${_pkgname}_linux_amd64"

package() {
  install -Dm755 "${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
