# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-crunchrr-clap-bin'
pkgver='release_66'
pkgrel='1'
pkgdesc='a digital degrader'
url="https://fx.amee.ee/plugin/crunchrr"
license=('custom:Potion Seller Public License')
source=("https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/crunchrr-x86_64-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt")
sha256sums=('bf5102122597b4f7638115d41f823f5f7b374b52be8394e0dbf6ac8781ccb06c'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/crunchrr-x86_64-unknown-linux-gnu.clap" "${pkgdir}/usr/lib/clap/crunchrr.clap"
}
