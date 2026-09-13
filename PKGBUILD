# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=djdeck
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal DJ deck: multi-deck player with beat-sync, pitch/tempo stretch and effects, low-latency to PipeWire"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/bl/djdeck"
license=('MIT')
depends=('libpipewire')
provides=('djdeck')
conflicts=('djdeck-git' 'djdeck-bin')
source_x86_64=("djdeck-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/bl/djdeck/releases/download/v${pkgver}/djdeck-v${pkgver}-x86_64.tar.gz")
source_aarch64=("djdeck-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/bl/djdeck/releases/download/v${pkgver}/djdeck-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('95951e00898bccefbd38da043ec262d8d469fb58b54ea763a585c5ef0fe86aba')
sha256sums_aarch64=('b4be59e69b58012fbabac329e55e51aa576dc3bbaf9d6d793cf508079e03702e')

package() {
    install -Dm755 djdeck "$pkgdir/usr/bin/djdeck"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
