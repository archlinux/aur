# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}-bin"
pkgver=0.1.9
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

sha256sums_x86_64=('435f4a5b8a4cb5ca23cc4f63500489d33f9de9821f205ae8455813224b610f2c')
sha256sums_aarch64=('d222b166c6a3cdf34082f8ce9113e21a1abb2155c288042a8bb35584697c06eb')

package() {
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
