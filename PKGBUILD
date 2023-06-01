# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tmux-zh_cn
pkgver=3.3a
pkgrel=2
pkgdesc="Chinese translation for tmux man pages"
arch=(any)
url=https://github.com/Freed-Wu/tmux-zh
license=(GPL3)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver-Linux.deb")
sha256sums=('3e0daf02e5c88a2ecd63feb6e403425c7a5d1af88433f7fc4705ace6d318de4a')

package() {
	tar vxaf data.tar.*z -C $pkgdir
}
