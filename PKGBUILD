# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=arch-updater
pkgver=0.0.6
pkgrel=1
pkgdesc="A granular update utility for Arch Linux designed for power users who demand full control and transparency over package upgrades"
arch=('any')
url="https://github.com/chpock/arch-updater"
license=('GPL-3.0-or-later')
depends=('pacman' 'pacman-contrib' 'yay' 'fzf' 'curl' 'jq' 'expac')
optdepends=('sudo: Privilege elevation'
            'arch-log: Retrieve package changelog')
source=("arch-updater::${url}/releases/download/v${pkgver}/arch-updater")
sha256sums=('05aac96c4797c03b8c5eb82d163e9e169ec9989e4847511af855f972f8107ad7')

package() {
    install -Dm755 "$srcdir/arch-updater" "$pkgdir/usr/bin/arch-updater"
}
