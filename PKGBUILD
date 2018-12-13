# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=CircleCI-Public
_upstream_pkgname=circleci-cli
_upstream_elfname=circleci
pkgname=circleci-cli-bin
pkgver=0.1.4427
pkgrel=1
pkgdesc="CircleCI's new command-line application."
arch=('x86_64')
_goos="linux"
_goarch="amd64"
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
license=("MIT")
### https://github.com/CircleCI-Public/circleci-cli/releases/download/v0.1.4427/circleci-cli_0.1.4427_linux_amd64.tar.gz
source=("${_upstream_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=(
  "14cac1c61de87b420699c1f7d7dcd5300d6a349ae3fc363f9e109c5ba565a6a8"
  "SKIP"
)

package() {

  install -Dm755 "${srcdir}/${_upstream_pkgname}_${pkgver}_${_goos}_${_goarch}/${_upstream_elfname}" "${pkgdir}/usr/bin/${_upstream_elfname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"
}
