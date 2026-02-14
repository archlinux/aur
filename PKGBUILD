# Maintainer: OpsGuild <contact@opsguild.com>
pkgname=shelldock
pkgver=1.3
pkgrel=1
pkgdesc="A fast, cross-platform shell command repository manager"
arch=('x86_64' 'aarch64')
url="https://github.com/OpsGuild/ShellDock"
license=('MIT')
depends=()
makedepends=()
source_x86_64=("https://github.com/OpsGuild/ShellDock/releases/download/v1.3/shelldock-linux-amd64")
source_aarch64=("https://github.com/OpsGuild/ShellDock/releases/download/v1.3/shelldock-linux-arm64")
sha256sums_x86_64=('2ad655ded19a80830ad9458b6eef02dccb3485642acf3aafc39f062aa13256f8')
sha256sums_aarch64=('SKIP')

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/shelldock-linux-amd64" "${pkgdir}/usr/bin/shelldock"
  else
    install -Dm755 "${srcdir}/shelldock-linux-arm64" "${pkgdir}/usr/bin/shelldock"
  fi
}

