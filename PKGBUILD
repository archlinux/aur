# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=oppai
pkgver=0.6.2
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
source_i686=('https://github.com/Francesco149/oppai/releases/download/0.6.2/oppai-0.6.2-linux-i386.tar.gz')
source_x86_64=('https://github.com/Francesco149/oppai/releases/download/0.6.2/oppai-0.6.2-linux-amd64.tar.gz')
sha256sums_i686=('7cfcab30f79799756c19bbf3a13342de77a3aea4f45bca5a6def2b7e813170c7')
sha256sums_x86_64=('d5bb82a43dcc3f6d2ad708c382f775eea8d4391b8848e0aabf276550335c1c94')

package() {
	cd "$srcdir/$pkgname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m755 oppai "$pkgdir/usr/bin/oppai"
}

# vim: set ts=4 sw=4 noet:
