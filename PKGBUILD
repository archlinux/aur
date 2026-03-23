# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}-bin"
pkgver=0.1.7
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

sha256sums_x86_64=('c0708b5626d591c3455c5f628f0647d427909acf792b085688e4a46fcfc951e6')
sha256sums_aarch64=('3a70e96a9a475e9e13ead880f5a17784bae9e8bf666b8e64c0dd316813370dda')

package() {
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
