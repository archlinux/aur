# Maintainer: Yaoyun <yaoyun_zhang at outlook dot com>

pkgname="splash-cli-bin"
pkgver="4.1.4"
pkgrel="1"
pkgdesc="A simple, CLI to download Unsplash wallpapers. Nothing fancy — it just works. "
arch=('x86_64')
url="https://github.com/rawnly/splash-cli"
license=('All rights reserved')
depends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rawnly/splash-cli/releases/download/${pkgver}/splash_Linux_x86_64.tar.gz")
sha256sums=('42a69c41356c5a7ec7d36ef0480a8fb8976f2742807c1748ac6af11996ab54cb')

package() {
    cd "${srcdir}"
    tar -xf "${pkgname}-${pkgver}.tar.gz"
    install -d "${pkgdir}/usr/bin"
    install -m755 "splash" "${pkgdir}/usr/bin/"
}
