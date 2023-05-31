# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tmux-zh_tw
pkgver=3.3a
pkgrel=1
pkgdesc="Chinese translation for tmux man pages"
arch=(any)
url=https://github.com/Freed-Wu/tmux-zh
license=(GPL3)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver-Linux.deb")
sha256sums=('88cb641ee43f7c6f14bd9f135670c933778740ed2adf4a09d8e1fc0bd6d22834')

package() {
	tar vxaf data.tar.xz -C $pkgdir
}
