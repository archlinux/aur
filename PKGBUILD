# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Smart session manager for the terminal"
arch=("x86_64" "arm64" "i386")
url="https://github.com/joshmedeski/sesh"
license=("MIT")
depends=("zoxide" "tmux")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_arm64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=("2da9b5da772269656b061944b84c3a422230979101fa4b12a51c171f65d5f41e")
sha256sums_i386=("4f7f6acf09a82f15a9de7da15499760b90d5caf21bace66358db66e7a2f5cc5b")
sha256sums_arm64=("7146bee74af5e682c306a4d296bdb0d0ad47ca5786cee314c34d66f1def215fe")

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
