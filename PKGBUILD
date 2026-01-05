# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard-launcher-bin
pkgver=0.1.14
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (Desktop App)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('shard-launcher')
conflicts=('shard-launcher')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-launcher-linux-x64.deb")
sha256sums=('ae9c8442cf1e714b0fcc76c5241c74259cd26475390ad59e1e4139886b47da3a')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
