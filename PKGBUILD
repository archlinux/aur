# Maintainer: Alexandre Berthaud <alexandre@berthaud.me>
pkgname=render-cli-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="The Official Render CLI (binary release)"
arch=(x86_64)
url="https://github.com/render-oss/cli"
license=('Apache-2.0')
source=("https://github.com/render-oss/cli/releases/download/v${pkgver}/cli_${pkgver}_linux_amd64.zip")
sha256sums=('9612c1f8ad19dea8bc669ad654ae3886b05005135e7d6574b6884ef5a56049dc')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
  install -D -m755 "cli_v${pkgver}" "${pkgdir}/usr/bin/render"
}

# vim:set ts=2 sw=2 et:

