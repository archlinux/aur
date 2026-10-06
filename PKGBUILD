# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-spectra-clap-bin'
pkgver='release_128'
pkgrel='2'
pkgdesc='a morphing engine'
url="https://fx.amee.ee/plugin/spectra"
license=('custom:Potion Seller Public License')
source=("https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/spectra-${CARCH}-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt")
sha256sums=('032dfaa43169e98c311c852aed561586ba0fb5a28d1face92ef77e60865244e7'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/spectra.clap" "${pkgdir}/usr/lib/clap/spectra.clap"
}
