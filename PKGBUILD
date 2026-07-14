# Maintainer: xiaot <i@sin.moe>

pkgname=piko-bin
_pkgname=piko
pkgver=0.1.4
pkgrel=1
pkgdesc="A small parallel downloader"
arch=('x86_64' 'aarch64')
url='https://github.com/UruhaLushia/piko'
license=('GPL-3.0-only')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/piko-linux-amd64-v1")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/piko-linux-arm64")
sha256sums_x86_64=('c28a57496b36ab03b28352a5490138f3115006532eb39771c3c019226c1e4304')
sha256sums_aarch64=('233a35205d80a9c5187cf23d88e5f01f08378c59013db563f07659740d68668b')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
