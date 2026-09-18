# Maintainer: Muhammad Dhiyaul Atha <bangkah@aur>

pkgname=atha
pkgver=3.1.0
pkgrel=1
pkgdesc="Safety and workflow layer for pacman"
arch=('x86_64')
url="https://github.com/Bangkah/Atha"
license=('MIT')
depends=('pacman' 'sudo' 'git')
source=("atha-${pkgver}::https://github.com/Bangkah/Atha/releases/download/v${pkgver}/atha-x86_64-linux")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/atha-${pkgver}" "${pkgdir}/usr/bin/atha"
}