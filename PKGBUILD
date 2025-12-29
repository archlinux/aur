# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=arch-updater
pkgver=0.0.4
pkgrel=1
pkgdesc="A granular update utility for Arch Linux designed for power users who demand full control and transparency over package upgrades"
arch=('any')
url="https://github.com/chpock/arch-updater"
license=('GPL-3.0-or-later')
depends=('pacman' 'pacman-contrib' 'yay' 'fzf' 'curl' 'jq' 'expac')
optdepends=('sudo: Privilege elevation'
            'arch-log: Retrieve package changelog')
source=("arch-updater::${url}/releases/download/v${pkgver}/arch-updater")
sha256sums=('ede97aa4be32d645c2fafa5e0eb100d3835d00e19f3bef8a5a774d8b9febb025')

package() {
    install -Dm755 "$srcdir/arch-updater" "$pkgdir/usr/bin/arch-updater"
}
