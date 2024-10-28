# Maintainer: Booomeii <604772159@qq.com>

pkgname=gear-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Web3 Ultimate Execution Engine"
arch=(x86_64)
url="https://github.com/gear-tech/gear"
licenses=(GPL3)
provides=("gear")
conflicts=("gear")
source=(https://get.gear.rs/gear-v${pkgver}-x86_64-unknown-linux-gnu.tar.xz)
sha256sums=('009476a3f6e96ba688bd8a0b5a78b09effa1340b46c05cd8287f8899347a2e1c')

package() {
    install -Dm755 "${srcdir}/gear" "${pkgdir}/usr/bin/gear"
}
