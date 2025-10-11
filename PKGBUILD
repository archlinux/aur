# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname="packrinth-bin"
pkgver="0.8.1"
pkgrel="1"
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://packrinth.thijzert.nl"
license=("MIT")

source_x86_64=("packrinth-${pkgver}.tar.xz::https://github.com/Thijzert123/packrinth/releases/download/v${pkgver}/packrinth-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("packrinth-${pkgver}.tar.xz::https://github.com/Thijzert123/packrinth/releases/download/v${pkgver}/packrinth-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("f1fb439f561c5437174286d15c2416fe84ea4f3ee2fd47906eef76cc96f72950")
sha256sums_aarch64=("f23566eacb972b791ddc2a4fdb1c56cb98950e7e5def233ad5fffb6fdc593132")

package() {
    install -Dm0755 "packrinth" "${pkgdir}/usr/bin/packrinth"
}
