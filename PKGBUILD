# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=spectrust
pkgver=0.2.8
pkgrel=1
pkgdesc="Terminal audio spectrum analyzer"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/bl/spectrust"
license=('MIT')
depends=('libpipewire')
provides=('spectrust')
conflicts=('spectrust-git' 'spectrust-bin')
source_x86_64=("spectrust-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/bl/spectrust/releases/download/v${pkgver}/spectrust-v${pkgver}-x86_64.tar.gz")
source_aarch64=("spectrust-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/bl/spectrust/releases/download/v${pkgver}/spectrust-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('f2f0e7b34ebf54134f713d426b9b06a387c4cefb8b7bf2548ad78fbe02b856e1')
sha256sums_aarch64=('4459d731d1791adde9bb956ebc5d3ac5fbbd74106529e480f6d0f91631604ecb')

package() {
    install -Dm755 spectrust "$pkgdir/usr/bin/spectrust"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
