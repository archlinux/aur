# Maintainer: CmdHub Contributors
pkgname=cmdh-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Decentralized registry and offline search tool for AI Agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/cmdhub-oss"
license=('MIT')
provides=('cmdh')
conflicts=('cmdh')
source_x86_64=("https://github.com/Xuepoo/cmdhub-oss/releases/download/v${pkgver}/cmdh-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/cmdhub-oss/releases/download/v${pkgver}/cmdh-linux-aarch64")
sha256sums_x86_64=('5bc9a3f8d1765b60baf8b2a84730bc19e29856a60183b4d9d85411d3cf649787')
sha256sums_aarch64=('d4ec39a3597abe20df1119f3d5590b1e106eb34d67bc307260f8ea704d50ab88')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${srcdir}/cmdh-linux-x86_64" "${pkgdir}/usr/bin/cmdh"
  else
    install -Dm755 "${srcdir}/cmdh-linux-aarch64" "${pkgdir}/usr/bin/cmdh"
  fi
}
