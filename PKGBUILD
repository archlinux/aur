# Maintainer: Alexandre Berthaud <alexandre@berthaud.me>
pkgname=render-cli-bin
pkgver=2.15.1
pkgrel=1
pkgdesc="The Official Render CLI (binary release)"
arch=(x86_64)
url="https://github.com/render-oss/cli"
license=('Apache-2.0')
source=("https://github.com/render-oss/cli/releases/download/v${pkgver}/cli_${pkgver}_linux_amd64.zip")
sha256sums=('ae1d8200723b9d56898187f681663cc10801fe70fc0e15f27e81ec30be6c00bf')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
  install -D -m755 "cli_v${pkgver}" "${pkgdir}/usr/bin/render"
}

# vim:set ts=2 sw=2 et:

