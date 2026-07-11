# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('c5612230fa803ff7008af05c76ec514942cd3c1c88710f32e3f320c23b6e356c')
sha256sums_aarch64=('276a6df78778497a414d6c927bc07b77eb5523aa707fc5b2c0af8993d58315d4')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
