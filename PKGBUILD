# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast-cli
pkgver=1.1.17
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

sha256sums_x86_64=('9aadf4c0a2502cafe4fcb0bc504f985f2119162a38137ba9c7e4a77ee7e0a412')
sha256sums_aarch64=('316168a29e1e9715dc9ad4058c2af5134ff0a66eab110b9d9294fccd40b0967a')