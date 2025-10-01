# Maintainer: Alexandre Berthaud <alexandre@berthaud.me>
pkgname=render-cli-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="The Official Render CLI (binary release)"
arch=(x86_64)
url="https://github.com/render-oss/cli"
license=('Apache-2.0')
source=("https://github.com/render-oss/cli/releases/download/v${pkgver}/cli_${pkgver}_linux_amd64.zip")
sha256sums=('1d48c5dcb510402ab4670f95e3b73b8b69bf0bb3f162bf7a8d7b37bdf20c990f')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
  install -D -m755 "cli_v${pkgver}" "${pkgdir}/usr/bin/render"
}

# vim:set ts=2 sw=2 et:

