# Maintainer: Noah Ramkissoon nohramkissoon1@gmail.com
pkgname=yak
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple AUR helper written in Bash using Pacman-like flags"
arch=('any')
url="https://github.com/rainbownx/yak"
license=('MIT')
depends=('bash' 'git' 'pacman' 'jq' 'curl')
source=("yak" "install.sh")
md5sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/yak" "$pkgdir/usr/bin/yak"
    install -Dm755 "$srcdir/install.sh" "$pkgdir/usr/share/yak/install.sh"
}
