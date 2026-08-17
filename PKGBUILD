# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('30fb13275bbf059035d6a248f45b0bdcc5338990195b93c65e844a10edd5f1ab')
sha256sums_aarch64=('1592c5fdc9c82fd1dca1722a84bdf06d667bc3336afe32317740e64beb6d18c8')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
