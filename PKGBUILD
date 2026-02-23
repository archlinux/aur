# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
_pkgname=sesh
pkgname=${_pkgname}-bin
pkgver=2.24.0
pkgrel=1
pkgdesc="Smart session manager for the terminal"
arch=("x86_64" "aarch64" "i686")
url="https://github.com/joshmedeski/sesh"
license=("MIT")
depends=("zoxide" "tmux")
provides=('sesh')
conflicts=('sesh')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('47a6618a720517df58054580e74ddb4c3b13eeb480c44806f91a29fc7e751f08')
sha256sums_aarch64=('47a6618a720517df58054580e74ddb4c3b13eeb480c44806f91a29fc7e751f08')
sha256sums_i686=('47a6618a720517df58054580e74ddb4c3b13eeb480c44806f91a29fc7e751f08')

package() {
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
