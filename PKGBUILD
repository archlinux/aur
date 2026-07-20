# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast-cli
pkgver=1.1.18
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

sha256sums_x86_64=('593aeb354e69ad303fed94ca94f19d931905a6509d690aee1565e4f7ca62d85d')
sha256sums_aarch64=('0503f3dc2f8555003c0b46aba6411db687c3ffbfdbe74c61163f039d21916dad')