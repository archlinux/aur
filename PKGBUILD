# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard-launcher-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (Desktop App)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('shard-launcher')
conflicts=('shard-launcher')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-launcher-linux-x64.deb")
sha256sums=('ba34e791a1e64af91ef2d7862fc20eebf84ff442b2954175764dd58585a32045')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
