pkgname=sshb0t-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="A bot for keeping your ssh authorized_keys up to date with github keys"
arch=('x86_64')
url="https://github.com/genuinetools/sshb0t"
license=('MIT')
conflicts=('sshb0t-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/sshb0t-linux-amd64")
package() {
  install -Dm755 $srcdir/sshb0t-linux-amd64  "${pkgdir}/usr/bin/sshb0t"
}
sha256sums=('1b231c8ced77eef54c01b9d96c4278da0e02f362502096eee940d345b10a90e7')
