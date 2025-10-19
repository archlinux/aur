# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname="packrinth-bin"
pkgver="0.8.2"
pkgrel="1"
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://packrinth.thijzert.nl"
license=("MIT")

source_x86_64=("packrinth-${pkgver}.tar.xz::https://github.com/Thijzert123/packrinth/releases/download/v${pkgver}/packrinth-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("packrinth-${pkgver}.tar.xz::https://github.com/Thijzert123/packrinth/releases/download/v${pkgver}/packrinth-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("dcfdae3233cd72795cba3f84487025fb2b05d31a8b936386c598c19f55881323")
sha256sums_aarch64=("8e4bfc6b467ac3adb17df8ae75cb648376362c5c88591b82e420ebf0ed899f5d")

package() {
    install -Dm0755 "packrinth" "${pkgdir}/usr/bin/packrinth"
}
