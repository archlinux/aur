# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=arch-updater
pkgver=0.0.2
pkgrel=1
pkgdesc="A granular update utility for Arch Linux designed for power users who demand full control and transparency over package upgrades"
arch=('any')
url="https://github.com/chpock/arch-updater"
license=('GPL-3.0-or-later')
depends=('pacman' 'pacman-contrib' 'yay' 'fzf' 'curl' 'jq' 'expac')
optdepends=('sudo: Privilege elevation'
            'arch-log: Retrieve package changelog')
source=("arch-updater::${url}/releases/download/v${pkgver}/arch-updater")
sha256sums=('f8092fa45e26cfadf18ec871adb769e3c429bc3dc76296daeace78ca12b6291a')

package() {
    install -Dm755 "$srcdir/arch-updater" "$pkgdir/usr/bin/arch-updater"
}
