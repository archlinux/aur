# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast-cli
pkgver=1.13.11-1
pkgrel=1
pkgdesc="A clash core based on sing-box"
arch=('x86_64' 'aarch64')
url="https://github.com/mapleafgo/cff-core"
license=('MIT')
conflicts=(${pkgname})
provides=(${pkgname})
source_x86_64=("${pkgname}-x86_64.tar.gz::https://github.com/mapleafgo/cff-core/releases/download/v${pkgver}/singcast-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64.tar.gz::https://github.com/mapleafgo/cff-core/releases/download/v${pkgver}/singcast-v${pkgver}-linux-arm64.tar.gz")

package() {
  install -Dm755 "${srcdir}/singcast-linux-"* "${pkgdir}/usr/bin/singcast-cli"
}

sha256sums_x86_64=('eb486bc10e5d93ddc8b6239065c54c91f464efd37ec3cd4952428f4ad8c7ff0e')
sha256sums_aarch64=('cfeff19513d6f6de030787bfcc5bd5f7161c4415ddebe06303d128cd5faa87e4')
