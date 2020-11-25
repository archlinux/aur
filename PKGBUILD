# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='faq'
pkgname="${_pkgname}-bin"
pkgver=0.0.6
pkgrel=1
pkgdesc='More flexible jq. Supports BSON, Bencode, JSON, TOML, XML, YAML'
arch=('x86_64')
url='https://github.com/jzelinskie/faq'
license=('APACHE')
depends=('jq')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-readme::${url}/raw/${pkgver}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/${pkgver}/faq-linux-amd64")

sha256sums=('af63ea88fe0a540f6c23d29866d6d5249699347e5f6b4ada3da97a72e8703197')
sha256sums_x86_64=('53360a0d22b0608d5e29f8e84450f2fdc94573246fb552896afedbf8f1687981')

package() {
  install -Dvm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 "${_pkgname}-${pkgver}-readme" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
