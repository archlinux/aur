# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=agent-sync-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line tool that synchronizes multiple AI agent documentation files"
arch=('x86_64')
url="https://github.com/GowayLee/agent-sync"
license=('GPL3')
source=("agent-sync-v$pkgver-linux-x86_64::https://github.com/GowayLee/agent-sync/releases/download/v$pkgver/agent-sync-v$pkgver-linux-x86_64")
sha256sums=('4983dceee3592a44c0d1454b6abbcdbb6dc357c3cd7750247e0282ebd65b948e')
options=('!debug')

package() {
  install -Dm755 "$srcdir/agent-sync-v$pkgver-linux-x86_64" "$pkgdir/usr/bin/agent-sync"
}

