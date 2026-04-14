# Maintainer: StepanKomis <https://github.com/StepanKomis>
pkgname=pkgtui
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal UI for Arch Linux package management via pacman and yay"
arch=('any')
url="https://github.com/StepanKomis/pkgtui"
license=('GPL-3.0-only')
depends=('python' 'fzf' 'sudo')
optdepends=('yay: AUR package support (required for AUR search and install)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/StepanKomis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7cb87508a583abab919c03a20b0563d4b4d8403ef9946f296014d175ba742f7e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pkgtui "$pkgdir/usr/bin/pkgtui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
