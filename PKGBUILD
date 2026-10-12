# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="A clash core based on sing-box"
arch=('x86_64' 'aarch64')
url="https://github.com/mapleafgo/singcast-cli"
license=('MIT')
conflicts=(${pkgname})
provides=(${pkgname})
source_x86_64=("${pkgname}-x86_64.tar.gz::https://github.com/mapleafgo/singcast-cli/releases/download/v${pkgver}/singcast-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64.tar.gz::https://github.com/mapleafgo/singcast-cli/releases/download/v${pkgver}/singcast-v${pkgver}-linux-arm64.tar.gz")

package() {
  install -Dm755 "${srcdir}/singcast-linux-"* "${pkgdir}/usr/bin/singcast-cli"
}

sha256sums_x86_64=('4e38c257ccbb146c36fb339c812060a54ff87cf7d89d5c99a9858d6428ca3167')
sha256sums_aarch64=('71d92bccd8edfe54fd080e62d6debcd645fb71258e73a038a428062db1c4e4bb')