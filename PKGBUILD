# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard-launcher-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (Desktop App)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('shard-launcher')
conflicts=('shard-launcher')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-launcher-linux-x64.deb")
sha256sums=('88454c0e3ca995fc6e4fbfd3eb7e895b79c9ffc289199c142f60a7623a8beedf')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
