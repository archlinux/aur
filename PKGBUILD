# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=galdr
pkgver=0.4.1
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
sha256sums_x86_64=('bb46411fa42b0324d689b3c7cc700a1c0073d2354900a212e7fbcdc7f96f2508')
sha256sums_aarch64=('dfd010e7e5719a4fddca522407469f7d390fc998cb69b76a51a705fae8d905f1')

package() {
    install -Dm755 galdr "$pkgdir/usr/bin/galdr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
