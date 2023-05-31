# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tmux-zh_cn
pkgver=3.3a
pkgrel=1
pkgdesc="Chinese translation for tmux man pages"
arch=(any)
url=https://github.com/Freed-Wu/tmux-zh
license=(GPL3)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver-Linux.deb")
sha256sums=('529765012a46c3baba3fbddf243d20bf7af41fbf085d6280ca26c3e0475a5e53')

package() {
	tar vxaf data.tar.xz -C $pkgdir
}
