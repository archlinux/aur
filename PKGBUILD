# Maintainer: OpsGuild <contact@opsguild.com>
pkgname=shelldock
pkgver=1.1
pkgrel=1
pkgdesc="A fast, cross-platform shell command repository manager"
arch=('x86_64' 'aarch64')
url="https://github.com/OpsGuild/ShellDock"
license=('MIT')
depends=()
makedepends=()
source_x86_64=("https://github.com/OpsGuild/ShellDock/releases/download/v1.1/shelldock-linux-amd64")
source_aarch64=("https://github.com/OpsGuild/ShellDock/releases/download/v1.1/shelldock-linux-arm64")
sha256sums_x86_64=('40da22ea1d41dce37c2a71cd234305029fa47d1705078e598f697cab384dab68')
sha256sums_aarch64=('SKIP')

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/shelldock-linux-amd64" "${pkgdir}/usr/bin/shelldock"
  else
    install -Dm755 "${srcdir}/shelldock-linux-arm64" "${pkgdir}/usr/bin/shelldock"
  fi
}

