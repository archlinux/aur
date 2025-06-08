# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
_pkgname=git-mkver
pkgname=git-mkver-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Automatic Semantic Versioning for git based software development'
arch=('x86_64')
url="https://github.com/idc101/${_pkgname}"
license=('MIT')
_pkgsrc="${_pkgname}-${pkgver}"

source_x86_64=("${_pkgsrc}-bin.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${CARCH}-${pkgver}.tar.gz")
sha256sums_x86_64=("775b75df4e1ee8ea874fdee360d89b278e9c90628c1b8f6ae51421960547a7d3")

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
