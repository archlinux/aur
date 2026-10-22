# Maintainer: Alexandre Berthaud <alexandre@berthaud.me>
pkgname=render-cli-bin
pkgver=2.31.0
pkgrel=1
pkgdesc="The Official Render CLI (binary release)"
arch=(x86_64)
url="https://github.com/render-oss/cli"
license=('Apache-2.0')
source=("https://github.com/render-oss/cli/releases/download/v${pkgver}/cli_${pkgver}_linux_amd64.zip")
sha256sums=('1cbebf1c0e083fd4410df7096fd76205bd5d6e81c7893f2587b34f1cfe2cdf85')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
  install -D -m755 "cli_v${pkgver}" "${pkgdir}/usr/bin/render"
}

# vim:set ts=2 sw=2 et:

