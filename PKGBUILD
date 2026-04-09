# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}-bin"
pkgver=0.1.10
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

sha256sums_x86_64=('7244be3807c61787b556258be5600c8516ca1c48f6f04df1088ae7e7a139427b')
sha256sums_aarch64=('968855aebe858c63f200ea1b7b0460f1c792d080da0eba1012fd31e5e76c2d99')

package() {
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
