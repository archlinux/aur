# Maintainer: CmdHub Contributors
pkgname=cmdh-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Decentralized registry and offline search tool for AI Agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/cmdhub-oss"
license=('MIT')
provides=('cmdh')
conflicts=('cmdh')
source_x86_64=("https://github.com/Xuepoo/cmdhub-oss/releases/download/v${pkgver}/cmdh-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/cmdhub-oss/releases/download/v${pkgver}/cmdh-linux-aarch64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${srcdir}/cmdh-linux-x86_64" "${pkgdir}/usr/bin/cmdh"
  else
    install -Dm755 "${srcdir}/cmdh-linux-aarch64" "${pkgdir}/usr/bin/cmdh"
  fi
}
