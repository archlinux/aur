# Maintainer: VCalV

_pkgname="tpm-vuln-checker"
pkgname="${_pkgname}-bin"
pkgver=1.3
pkgrel=2
pkgdesc="TPM 2.0 Vulnerability Scanning Tool"
arch=('x86_64')
url="https://github.com/immune-gmbh/tpm-vuln-checker"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=()
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/immune-gmbh/${_pkgname}/releases/download/v${pkgver}/tpm-vuln-checker_${pkgver}_linux_amd64.tar.gz"
)
sha512sums=('460917270d70d92448f393d86057b739fa1f2c780daba80d9c90662bb467d3b0cb5c4822fd3deda967374e7217e0af1e57947950f0f891cd0dd0a399c436ff52')
sha256sums=('fd1bd2a3fab7faaf8b9d1f60b82cc82d06f7ce5a0e89ea9ee068ef64b8914717')


package() {
  install -Dm555 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm444 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
