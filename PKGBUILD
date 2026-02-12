# Maintainer: Alexandre Berthaud <alexandre@berthaud.me>
pkgname=render-cli-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="The Official Render CLI (binary release)"
arch=(x86_64)
url="https://github.com/render-oss/cli"
license=('Apache-2.0')
source=("https://github.com/render-oss/cli/releases/download/v${pkgver}/cli_${pkgver}_linux_amd64.zip")
sha256sums=('29f0640ec9f4c1c5576689370da0c732db181254e833b1c1c53ae2d0ced51c31')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
  install -D -m755 "cli_v${pkgver}" "${pkgdir}/usr/bin/render"
}

# vim:set ts=2 sw=2 et:

