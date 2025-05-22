pkgname=ssh-manager
pkgver=1.0
pkgrel=2
pkgdesc="Simple terminal password manager for SSH/RDP with GPG encryption"
arch=('any')
url="https://github.com/madyel/sshManager"
license=('GPL3')
depends=('python' 'gnupg' 'sshpass')
optdepends=('fzf: for interactive selection' 'rofi: graphical selection')
source=('ssh-manager')
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/ssh-manager" "$pkgdir/usr/bin/ssh-manager"
}
