# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}-bin"
pkgver=0.1.4
pkgrel=1
pkgdesc="Dune Analytics CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/duneanalytics/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)

source_x86_64=("${_pkgname}_${pkgver}_linux_amd64.tar.gz::https://github.com/duneanalytics/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::https://github.com/duneanalytics/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('8c1d4a9fcc90f45225892a103645a96ce0ae0d4921e4ef30af45242e437d19fa')
sha256sums_aarch64=('82aec01332aa3c8a7f3610426694b3a992b3e5117317db457c97cf17ca7ed655')

package() {
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
