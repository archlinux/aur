# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('4c3fdc0129cffbcc2425c3533062a771c1a9fda24b314b36bca0c4f8974cf7ea')
sha256sums_aarch64=('f4f033898d86e534d3c06c5cd1b3e17dfc30145ac509d7e2ab059cfa53e49a66')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
