# Maintainer: Eroldin <djnightchild at gmail dot com>
pkgname=vssh
pkgver=1.0
pkgrel=0
pkgdesc="A plugin for VirtualBox which gives easy CLI access to installed OpenSSH Servers on the system without populating the known_hosts file."
arch=(x86_64)
url="https://github.com/Eroldin/vssh"
license=("CC BY-SA 4.0")
depends=("virtualbox" "sshpass" "openssh")
source=("https://github.com/Eroldin/vssh/releases/download/v$pkgver/vssh-1.0.tbz2")
sha256sums=("6f888ac72ed5769459cf6322a30a3a7f0e6eba2e8f2682b53175f48ff47583c1")

package() {
  # executable
  install  -D -m755 "$srcdir/vssh" "$pkgdir/usr/bin/vssh"
  #license
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/vssh/LICENSE"
}
