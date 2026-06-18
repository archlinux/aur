# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=bash-aur-retriever
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist Bash AUR Retriever and system updater tool"
arch=('x86_64' 'aarch64')
url="https://github.com/goremakesthingsforarch-sys/bar"
license=('GPL')
depends=('bash' 'curl' 'jq' 'pacman')
source=("bar-${pkgver}.tar.gz::https://github.com/goremakesthingsforarch-sys/bar/archive/v${pkgver}.tar.gz")
sha256sums=('4669c56ad41975a5b5631707b2dac603d3bc54e5bf88a7214b517f2938767c1c')

package() {
    cd "${srcdir}/bar-${pkgver}"
    install -Dm755 bar "${pkgdir}/usr/bin/bar"
}
