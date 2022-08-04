# Maintainer: mekb https://github.com/mekb-turtle
pkgname=mekfetch-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple neofetch alternative written in C'
arch=('any')
url="https://github.com/mekb-turtle/mekfetch"
source=("mekfetch::https://github.com/mekb-turtle/mekfetch/releases/download/$pkgver/mekfetch")
sha256sums=('87347cab4bfbd0f418c2fd73ba34901b2e6980aff96f7854df54c9d81c0382ad')
optdepends=('ttf-nerd-fonts-symbols: Nerd font support')
package() {
	install -Dm755 "$srcdir/mekfetch" "$pkgdir/usr/bin/mekfetch"
}
