# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=galdr
pkgver=0.5.0
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
sha256sums_x86_64=('3204cde1874d269d33c3eff93fe8be58dbe7bdc218555a1e044bb9b07d88106b')
sha256sums_aarch64=('05f30e8a7554a4a6c5cc3fdd24ce78d3e7186366a0da66eba49e69976fd1cf37')

package() {
    install -Dm755 galdr "$pkgdir/usr/bin/galdr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
