# Maintainer: Enriquefft <https://github.com/Enriquefft>
pkgname=oryx-bench-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='ZSA Oryx keyboard layout manager — pull, lint, generate, build, and flash QMK firmware'
arch=('x86_64' 'aarch64')
url='https://github.com/enriquefft/oryx-bench'
license=('MIT')
depends=('docker')
provides=('oryx-bench')
conflicts=('oryx-bench')

source_x86_64=("https://github.com/enriquefft/oryx-bench/releases/download/v${pkgver}/oryx-bench-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/enriquefft/oryx-bench/releases/download/v${pkgver}/oryx-bench-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 oryx-bench "${pkgdir}/usr/bin/oryx-bench"
}
