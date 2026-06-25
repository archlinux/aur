# Maintainer: CmdHub Contributors
pkgname=cmdh-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Decentralized registry and offline search tool for AI Agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/cmdhub-oss"
license=('MIT')
provides=('cmdh')
conflicts=('cmdh')
source_x86_64=("https://github.com/Xuepoo/cmdhub-oss/releases/download/v${pkgver}/cmdh-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/cmdhub-oss/releases/download/v${pkgver}/cmdh-linux-aarch64")
sha256sums_x86_64=('4bdcde31eb0b92f9e3f87b18c3bb1ca49f8426b5c3b3d9a3254de25b0610fec1')
sha256sums_aarch64=('325af8e7d9df42e8480a2cc2f0a5b663168e16257f3f94fa948b79f89e764d65')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${srcdir}/cmdh-linux-x86_64" "${pkgdir}/usr/bin/cmdh"
  else
    install -Dm755 "${srcdir}/cmdh-linux-aarch64" "${pkgdir}/usr/bin/cmdh"
  fi
}
