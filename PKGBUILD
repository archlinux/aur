# Maintainer: BlackFuffey <18765895345lb@example.com>
pkgname=mcmodvcs
pkgver=1.3
pkgrel=1
pkgdesc="Simple VCS for managing Minecraft mods"
arch=('any')
url="https://github.com/BlackFuffey/mcmodvcs"
license=('MIT')
depends=('bash')

source=("mcmods.sh")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/mcmods.sh" "$pkgdir/usr/bin/mcmods"
}

