# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('peroxide-ssh-manager-bin')
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal-based SSH connection manager written in Rust"
arch=('x86_64')
url="https://github.com/0xGingi/peroxide"
license=('MIT')
depends=('glibc' 'gcc-libs' 'sshpass')
makedepends=('git')
provides=('peroxide-ssh-manager')
conflicts=('peroxide-ssh-manager')
source=("https://github.com/0xgingi/peroxide/releases/download/v$pkgver/peroxide-linux-x64")
md5sums=('SKIP')

package() {
    install -Dm755 peroxide-linux-x64 "$pkgdir/usr/bin/peroxide"
}
