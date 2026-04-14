# Maintainer: StepanKomis <https://github.com/StepanKomis>
pkgname=pkgtui
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal UI for Arch Linux package management via pacman and yay"
arch=('any')
url="https://github.com/StepanKomis/pkgtui"
license=('custom:unlicense')
depends=('python' 'fzf')
optdepends=('yay: AUR package support (required for AUR search and install)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/StepanKomis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('59bf2cdd35e3ed22a678b958da6dab89c5e7bd815adce753694969256c5a55f4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pkgtui "$pkgdir/usr/bin/pkgtui"
}
