# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=spectrust
pkgver=0.2.9
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
sha256sums_x86_64=('f1254163443d1b53e516db75b84ccd64565a25cdbff6392c2b5913890aead4b1')
sha256sums_aarch64=('728097cb12d6dd39e7f578084847346e0a54783112e6f6051fbe4e83e378b8e3')

package() {
    install -Dm755 spectrust "$pkgdir/usr/bin/spectrust"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
