pkgname=aurroamer
pkgver=1.0.0
pkgrel=1
pkgdesc="interactive terminal based package browser for both official and aur packages using fzf"
arch=('any')
url="https://aur.archlinux.org/packages/aurroamer"
license=('MIT')
depends=('bash' 'fzf' 'curl')
optdepends=(
    'yay: AUR helper support'
    'paru: AUR helper support'
    'trizen: AUR helper support'
    'pikaur: AUR helper support'
)
source=("aurroamer.sh" "LICENSE")
sha256sums=('SKIP' 'SKIP')
install=

package() {
install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

