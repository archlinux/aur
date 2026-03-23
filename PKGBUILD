pkgname=ssh-manager
pkgver=1.1
pkgrel=2
pkgdesc="Simple terminal password manager for SSH/RDP with GPG encryption"
arch=('any')
url="https://github.com/madyel/ssh-manager-aur"
license=('GPL-3.0-only')
depends=('python' 'gnupg' 'sshpass')
optdepends=(
  'fzf: terminal fuzzy selection'
  'rofi: terminal fuzzy selection'
  'rdesktop: RDP session support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/madyel/ssh-manager-aur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/ssh-manager-aur-$pkgver/ssh_manager.py" "$pkgdir/usr/bin/ssh-manager"
}