# Maintainer: Klod Cripta <KlodCripta@linux.it>
pkgname=cleaner-advanced
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple system cleaning program for Arch Linux"
arch=('any')
url="https://github.com/KlodCripta/Cleaner-Advanced"
license=('MIT')
depends=('bash')
source=("https://github.com/KlodCripta/Cleaner-Advanced/raw/main/cleaner-advanced.tar.gz")
sha256sums=('cfeb60fed2e496ba8e41d6d02a706301a537076b2713c7ac46bd2d5384aa0217')

prepare() {
    cd "$srcdir"
    tar -xvf cleaner-advanced.tar.gz
}

package() {
    cd "$srcdir/cleaner-advanced"
    install -Dm755 "cleaner_advanced.sh" "$pkgdir/usr/bin/cleaner_advanced"
    install -Dm644 "cleaner_advanced.desktop" "$pkgdir/usr/share/applications/cleaner_advanced.desktop"
    install -Dm644 "icons8-clean-48.png" "$pkgdir/usr/share/pixmaps/icons8-clean-48.png"
}
