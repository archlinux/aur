# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('ec65d8787dfdede44a2fca3d4923b59e503bb1ca3483b266626d278ac9a2b437')
sha256sums_aarch64=('3a391001ca280810d3068f743b51f0489b08132b693c2a26267d1ac6428ad4d3')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
