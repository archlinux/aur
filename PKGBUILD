# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('a67550cd0e38d1832b43b73ece84f6bc7c6db50dfb00ec6415b8393e703c393b')
sha256sums_aarch64=('1965c43571e21522a0d89afbec0d0662b2a76ddd62620aba1ead8933a52ae81d')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
