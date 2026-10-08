# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=galdr
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal grid synthesizer: signal flows through single-glyph unit generators, MIDI in, low-latency PipeWire out"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/bl/galdr"
license=('MIT')
depends=('libpipewire' 'alsa-lib')
provides=('galdr')
conflicts=('galdr-git' 'galdr-bin')
source_x86_64=("galdr-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/bl/galdr/releases/download/v${pkgver}/galdr-v${pkgver}-x86_64.tar.gz")
source_aarch64=("galdr-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/bl/galdr/releases/download/v${pkgver}/galdr-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('8a3f0269e64da63bf432e86f69bf18de5613e5bcb3c39a0601a676eed0d3a031')
sha256sums_aarch64=('fedea4c8ff8ffee90765af0e4ed12cf2ee1b52070dcd76b3fe94f6c164a9e652')

package() {
    install -Dm755 galdr "$pkgdir/usr/bin/galdr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
