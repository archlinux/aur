# Maintainer: NEOAPPS <neo@obsidianos.xyz> <asd22.info@gmail.com>
# Maintainer: TheOddCell <odd@obsidianos.xyz>
pkgname=obsidianos-branding
pkgver=1.0.0
pkgrel=1
pkgdesc="ObsidianOS branding (os-release and logos)"
arch=('x86_64')
url="https://github.com/Obsidian-OS"
license=('MIT')
depends=()
makedepends=()
source=("obsidianos.png::https://obsidianos.xyz/logo.png" "os-release::https://obsidianos.xyz/os-release")
sha256sums=('SKIP' 'SKIP')
package() {
    mkdir -p "$pkgdir/usr/share/pixmaps" "$pkgdir/etc"
    cp obsidianos.png "$pkgdir/usr/share/pixmaps/obsidianos.png"
    cp os-release "$pkgdir/etc/os-release"
}
