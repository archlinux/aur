pkgname=pkgpick
pkgver=2.0.0
pkgrel=1
pkgdesc="Interactive fzf-based package picker for pacman/yay/paru (AUR, official, installed), EN/RU UI"
arch=('any')
url="https://github.com/ItzDast/pkgpick"
license=('GPL-3.0-or-later')
depends=('bash' 'fzf' 'pacman')
optdepends=(
    'yay: AUR search/install/update support'
    'paru: alternative AUR helper (used if yay is absent)'
    'flatpak: manage Flatpak apps and runtimes'
    'npm: manage global npm packages'
    'python-pip: manage pip packages'
    'cargo: manage cargo-installed binaries'
    'go: manage go-installed binaries'
)
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/ItzDast/pkgpick.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/pkgpick.sh" "$pkgdir/usr/bin/pkgpick"
}
