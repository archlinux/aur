# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=shelf-bin
_pkgver=0.5.0
pkgver=v${_pkgver}
pkgrel=2
pkgdesc="A Good Symlinks Manager"
arch=('x86_64' 'armv6' 'armv7' 'aarch64')
url="https://github.com/iamd3vil/shelf"
license=('MIT')
depends=()
makedepends=()
provides=('shelf')
conflicts=()
source_x86_64=("https://github.com/iamd3vil/shelf/releases/download/${pkgver}/shelf_${_pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/iamd3vil/shelf/releases/download/${pkgver}/shelf_${_pkgver}_Linux_arm64.tar.gz")
source_armv6=("https://github.com/iamd3vil/shelf/releases/download/${pkgver}/shelf_${_pkgver}_Linux_armv6.tar.gz")
source_armv7=("https://github.com/iamd3vil/shelf/releases/download/${pkgver}/shelf_${_pkgver}_Linux_armv7.tar.gz")
sha256sums_x86_64=('8f3be7b68c4ad235218cc2e086f7828f6b73aaaf9b07c44fd411f826f1be1475')
sha256sums_aarch64=('fa1180fc71238928157defbc81f015efb08c915abef3f16347aab47c88613227')
sha256sums_armv6=('54d21803e8ec5bb9bfdae425a38e09344a059ba3bf9d72302f601ccbd4425f2b')
sha256sums_armv7=('3e54fa261a85761efbcfdf7eda1a1f7ae44ce321c5062173561abbea7ee562e6')

package() {
    cd "${srcdir}/"

    # Install shelf
    install -D -m0755 shelf \
        "${pkgdir}/usr/bin/shelf"
}
