# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tmux-zh_cn
pkgver=3.3.0
pkgrel=1
pkgdesc="Chinese translation for tmux man pages"
arch=(any)
url=https://github.com/Freed-Wu/tmux-zh
license=(GPL3)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver-Linux.deb")
sha256sums=('f079a8416e9c3ccf144614249d4e51ee6ce0a2236569aa928533b15a43ffce86')

package() {
	tar vxaf data.tar.xz -C $pkgdir
}
