# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=spectrust
pkgver=0.2.5
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
sha256sums_x86_64=('1ff123f356ca768835d8953b6cc138779149f8ccbbef2d39558a330dd767ca07')
sha256sums_aarch64=('27d035fc0bc0d169776ed68bd99fd7d7db1a03fccad318d008c70ff0d792cb25')

package() {
    install -Dm755 spectrust "$pkgdir/usr/bin/spectrust"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
