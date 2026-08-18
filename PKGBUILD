# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('dc60cee2f96e694a09796031c6633f637a29f7969a405f8ccdd153cb658fb675')
sha256sums_aarch64=('fd5bc2578752c52f9c0351d86a1436633d283266fc0ef4523c3d6185d0131aba')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
