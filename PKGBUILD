# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tmux-zh_tw
pkgver=3.3a
pkgrel=2
pkgdesc="Chinese translation for tmux man pages"
arch=(any)
url=https://github.com/Freed-Wu/tmux-zh
license=(GPL3)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver-Linux.deb")
sha256sums=('168958c6dac2a4db2f5235300561994e11507151d120ef41ea50228bfcb36baa')

package() {
	tar vxaf data.tar.*z -C $pkgdir
}
