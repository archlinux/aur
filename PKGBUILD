# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=galdr
pkgver=0.4.0
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
sha256sums_x86_64=('c498316843c4c84444ba02640ad7012e6fd085bbc258748c5608005fdbe3232a')
sha256sums_aarch64=('d22d71b90db8e0bc6763b32c36303f8ad0b86c6b5b935f43827f1725e6ab0a32')

package() {
    install -Dm755 galdr "$pkgdir/usr/bin/galdr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
