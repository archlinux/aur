# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tmux-zh_tw
pkgver=3.3.0
pkgrel=1
pkgdesc="Chinese translation for tmux man pages"
arch=(any)
url=https://github.com/Freed-Wu/tmux-zh
license=(GPL3)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver-Linux.deb")
sha256sums=('827b305d5d4d4964e6daea40a3780498e719c60185ef882b542a0796b3d1eafa')

package() {
	tar vxaf data.tar.xz -C $pkgdir
}
