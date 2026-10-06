# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-crunchrr-clap-bin'
pkgver='release_128'
pkgrel='1'
pkgdesc='a digital degrader'
url="https://fx.amee.ee/plugin/crunchrr"
license=('custom:Potion Seller Public License')
source=("https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/crunchrr-x86_64-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt")
sha256sums=('f12b0da2d2e8f70f3c60cd93d721d15676f4102a0e42c2492c80114e76dc69d6'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/crunchrr.clap" "${pkgdir}/usr/lib/clap/crunchrr.clap"
}
