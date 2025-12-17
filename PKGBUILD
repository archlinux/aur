# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname="packrinth-bin"
pkgver="0.8.3"
pkgrel="1"
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://packrinth.thijzert.nl"
license=("MIT")

source_x86_64=("packrinth-${pkgver}.tar.xz::https://github.com/Thijzert123/packrinth/releases/download/v${pkgver}/packrinth-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("packrinth-${pkgver}.tar.xz::https://github.com/Thijzert123/packrinth/releases/download/v${pkgver}/packrinth-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("34984f7999622c1948c3be15f71e55f5efba261f0a30a53be8822739a6fe3328")
sha256sums_aarch64=("f1078e6d19f4f8d5067f8962ca94bdd138b739f8267002336903270517ed1957")

package() {
    install -Dm0755 "packrinth" "${pkgdir}/usr/bin/packrinth"
}
