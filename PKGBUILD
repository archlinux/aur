# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('eebcf6a4e599803fa33548b24b8ca7567a136bf4d46f3c45f93e6ee78944d829')
sha256sums_aarch64=('7a0820d5a619a9be04ac3cd73a1b030c40e3226a063ff8dd4dfac54454156ae6')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
