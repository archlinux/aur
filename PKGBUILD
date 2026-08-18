# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('07e1688581dffaf2d42b34f2e4c823bd55ba93dfc293e7a2a68bd132a02dbe3d')
sha256sums_aarch64=('ab2e94c45390b6bf18295561b3cb627682f7e37475997a2a339a2cad614041a6')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
