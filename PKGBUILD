# Maintainer: therock
pkgname=aurroamer
pkgver=2.0
pkgrel=4
pkgdesc="An interactive terminal-based package browser for both official and AUR packages using fzf"
arch=('any')
url="https://aur.archlinux.org/packages/aurroamer"
license=('MIT')
depends=('bash' 'fzf' 'curl' 'gzip')
optdepends=(
    'yay: AUR helper support'
    'paru: AUR helper support'
    'trizen: AUR helper support'
    'pikaur: AUR helper support'
)
source=("aurroamer" "LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

