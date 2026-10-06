# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-filtrr-clap-bin'
pkgver='release_128'
pkgrel='1'
pkgdesc='a digital degrader'
url="https://fx.amee.ee/plugin/filtrr"
license=('custom:Potion Seller Public License')
source=("https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/filtrr-${CARCH}-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt")
sha256sums=('bfc02a8d203da095509fa5ddf78a0d9b396c2447b7a3bcc10f2c362e8583501b'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/filtrr.clap" "${pkgdir}/usr/lib/clap/crunchrr.clap"
}
