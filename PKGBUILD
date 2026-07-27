# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast-cli
pkgver=1.1.21
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

sha256sums_x86_64=('66a5f1ec228a740ead3e2df096a2637d024cd4bc22ba88960ff27acd9457b6f3')
sha256sums_aarch64=('0073f04062617be9feffb33d942d41bbafaf728cb8836a0504faf6c905073782')