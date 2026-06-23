# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=spectrust
pkgver=0.2.6
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
sha256sums_x86_64=('9e4a0c49ab12c3671258f857bae33fde9dd24596489bf941957cd81cff370fec')
sha256sums_aarch64=('1cff1b4e8aec433183a9e81e511587c7885c1dea778d43c761e67c55cf425a06')

package() {
    install -Dm755 spectrust "$pkgdir/usr/bin/spectrust"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
