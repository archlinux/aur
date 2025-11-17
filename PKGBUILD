pkgname=all
pkgver=1.0.0
pkgrel=1
pkgdesc="A universal package manager wrapper supporting pacman, yay, apt, dnf, zypper, flatpak, and snap"
arch=('any')
url="https://github.com/aquacheese/all"
license=('MIT')
depends=('bash')
optdepends=('pacman: for Arch Linux package management'
            'yay: for AUR package management'
            'apt: for Debian/Ubuntu package management'
            'dnf: for Fedora/RHEL package management'
            'zypper: for openSUSE package management'
            'flatpak: for Flatpak package management'
            'snap: for Snap package management')
source=("all" "LICENSE")
sha256sums=('3ba87a950b937a84d6e49bf4a5353b134ee2e5be4f885708fdee3417aad3f221'
            '0c53dc1fa7bdfcc12d18477502fa6462f5ac3742a749786ffa7647d48081403a')

package() {
    install -Dm755 "$srcdir/all" "$pkgdir/usr/bin/all"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}