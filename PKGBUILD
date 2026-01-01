# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard-launcher-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (Desktop App)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('shard-launcher')
conflicts=('shard-launcher')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-launcher-linux-x64.deb")
sha256sums=('4da9471ba1f70ffb369c4748a33d2e3c22b6744eb9ac589ad84ae724bdf6e533')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
