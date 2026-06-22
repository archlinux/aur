# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=spectrust
pkgver=0.2.4
pkgrel=1
pkgdesc="Terminal audio spectrum analyzer"
arch=('x86_64' 'aarch64')
url="https://prosjekt.klingenbergbygg.no/bl/spectrust"
license=('MIT')
depends=()
provides=('spectrust')
conflicts=('spectrust-git' 'spectrust-bin')
source_x86_64=("spectrust-v${pkgver}-x86_64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/spectrust/releases/download/v${pkgver}/spectrust-v${pkgver}-x86_64.tar.gz")
source_aarch64=("spectrust-v${pkgver}-aarch64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/spectrust/releases/download/v${pkgver}/spectrust-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('33e1bbd31e31a9692ed25fc580ebf1ff54f6cba5d91f1acbd0af138ab9b5957f')
sha256sums_aarch64=('6ade45e3ff1c2f89dd918ee5dabfca50f5463047bbd8245e85512ba5c533123e')

package() {
    install -Dm755 spectrust "$pkgdir/usr/bin/spectrust"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
