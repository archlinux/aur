# Maintainer: Achintya <achintya22052000@gmail.com>
# AUR package — built from GitHub releases (pre-compiled binary).
# See https://github.com/achintya-7/paruz

pkgname=paruz-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A TUI frontend for paru/yay package management"
arch=('x86_64')
url="https://github.com/achintya-7/paruz"
license=('MIT')
options=('!strip')
source=("$url/releases/download/v$pkgver/paruz-linux-x86_64.tar.gz")
sha256sums=('7749b89f3f29e639efb836b14feca330b93473d6b8eda8a3b9f1366fd568bdaf')
provides=('paruz')
conflicts=('paruz')

package() {
  install -Dm755 paruz "$pkgdir/usr/bin/paruz"
}
