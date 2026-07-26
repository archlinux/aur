# Maintainer: xiaot <i@sin.moe>

pkgname=piko-bin
_pkgname=piko
pkgver=0.1.5
pkgrel=1
pkgdesc="A small parallel downloader"
arch=('x86_64' 'aarch64')
url='https://github.com/UruhaLushia/piko'
license=('GPL-3.0-only')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-${pkgrel}-x86_64::${url}/releases/download/v${pkgver}/piko-linux-amd64-v1")
source_aarch64=("${_pkgname}-${pkgver}-${pkgrel}-aarch64::${url}/releases/download/v${pkgver}/piko-linux-arm64")
sha256sums_x86_64=('3346ac1c5090a0c24ca8dcd87c867e509d9b0e866b24044ae0ba7df2c68c62a1')
sha256sums_aarch64=('f652612c892c23820b16c78af0085faffeaf4d2ee0deecf0dc61a548c559014e')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
