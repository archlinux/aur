# Maintainer: StepanKomis <https://github.com/StepanKomis>
pkgname=pkgtui
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal UI for Arch Linux package management via pacman and yay"
arch=('any')
url="https://github.com/StepanKomis/pkgtui"
license=('GPL-3.0-only')
depends=('python' 'fzf' 'sudo')
optdepends=('yay: AUR package support (required for AUR search and install)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/StepanKomis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('03f8fb648cd84e3220a5298a741f8e1f665417007a48c753161533cfc8ac0857')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pkgtui "$pkgdir/usr/bin/pkgtui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
