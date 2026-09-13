# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=galdr
pkgver=0.2.2
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
sha256sums_x86_64=('02d1d371d2842ae4ed95e4fa82b7c92d75e550af4b8bcda8d399c4afad1533e2')
sha256sums_aarch64=('803894e36d5c0b692c287aaf581e8f6612305534d52f82073cfacbf215b1ac37')

package() {
    install -Dm755 galdr "$pkgdir/usr/bin/galdr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
