# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard-launcher-bin
pkgver=0.1.24
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (Desktop App)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('shard-launcher')
conflicts=('shard-launcher')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-launcher-linux-x64.deb")
sha256sums=('286d4634aba16acafa10bce94641f1b8daf923d4fb15df2dccc9125fbfe8e222')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
