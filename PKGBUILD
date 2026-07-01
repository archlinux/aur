# -*- mode: sh; -*-

pkgname=dot-vault
pkgver=1.1.0
pkgrel=1
pkgdesc="A secure vault utility for managing, backing up, and restoring dotfiles with a TUI."
arch=('any')
url="https://aur.archlinux.org/packages/dot-vault"
license=('MIT')
depends=('bash' 'coreutils' 'tar' 'file' 'findutils')
provides=('dotfiles-manager')
conflicts=('fish-manager')
source=("$pkgname::https://aur.archlinux.org/$pkgname.tar.gz")
source=("$pkgname.sh")
sha256sums=('SKIP')

build() {

    chmod +x "$pkgname.sh"
}

package() {

    install -Dm755 "$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"


}
