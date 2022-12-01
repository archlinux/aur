# Maintainer: Emmie Maeda <emmie.maeda@gmail.com>

pkgname=oppai
pkgver=0.9.11
pkgrel=1
pkgdesc='osu! pp advanced inspector (oppai) is pp calculator for osu! beatmaps'
arch=('x86_64' 'i686')
url='https://github.com/Francesco149/oppai'
license=('GPL3')
options=('!strip')
makedepends=()
depends=()
optdepends=('curl: For piping beatmaps into oppai')
provides=('oppai')
conflicts=('oppai')
source_i686=('https://github.com/Francesco149/oppai/releases/download/0.9.11/oppai-0.9.11-linux-i686.tar.xz')
source_x86_64=('https://github.com/Francesco149/oppai/releases/download/0.9.11/oppai-0.9.11-linux-x86_64.tar.xz')
sha256sums_i686=('29274f1c2514361f949c87fddaddbf1c6b7544abe60d3fd436e816cdc8a6c0f8')
sha256sums_x86_64=('90c1ee3bdb0311901129e5bd47a39f3ffc82518197582bfdf5546baa4ae46133')

package() {
	cd "$srcdir/$pkgname-$pkgver-linux-$CARCH"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m755 oppai "$pkgdir/usr/bin/oppai"
}

# vim: set ts=4 sw=4 noet:
