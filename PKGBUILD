# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-prisma-clap-bin'
pkgver='release_128'
pkgrel='1'
pkgdesc='a chromatic manipulator'
url="https://fx.amee.ee/plugin/prisma"
license=('custom:Potion Seller Public License')
source=("https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/prisma-${CARCH}-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt")
sha256sums=('4b597c380469f26004c351ff7fc57a4617671e1501a49c54cbe7264f62bfbe3d'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/prisma.clap" "${pkgdir}/usr/lib/clap/prisma.clap"
}
