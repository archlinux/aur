# Maintainer: NEOAPPS <neo@obsidianos.xyz> <asd22.info@gmail.com>
# Maintainer: TheOddCell <odd@obsidianos.xyz>
pkgname=obsidianos-branding
pkgver=2026.01.31
pkgrel=3
pkgdesc="ObsidianOS branding (logo)"
arch=('x86_64')
url="https://github.com/Obsidian-OS"
license=('MIT')
depends=()
makedepends=()
source=("obsidianos.png::https://obsidianos.xyz/logo.png")
sha256sums=('SKIP')
package() {
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp obsidianos.png "$pkgdir/usr/share/pixmaps/obsidianos.png"
}
