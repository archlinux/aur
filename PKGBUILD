# Maintainer: diced <pranaco2@gmail.com>
pkgname='dvm'
pkgver=1.1.8
pkgrel=1
conflicts=('discord' 'discord-canary' 'discord-ptb' 'discord-development' 'dvm-git')
arch=('x86_64')
pkgdesc="discord version manager for linux"
url="https://github.com/diced/dvm"
source=("$url/releases/download/$pkgver/dvm-x86_64-unknown-linux-gnu")
sha256sums=('SKIP')
licence=('MIT')

package() {
  cd "$srcdir"
  
  install -D -o root -g root -m 755 dvm-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/dvm"
}
