# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('65564a6fb9370217ca6cd2a3a793da464037c4f31abd4a00d2ff21570058f72a')
sha256sums_aarch64=('12a6f6349ab16ca71b663ae3da81a3436bbd05dbf4a0b6f9da7b11483f476bdd')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
