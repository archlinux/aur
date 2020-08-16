# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-essay-simp
pkgver=0.0.0.20200816
_commit=a86a2e8de8d3af66a6c084eccf4cb8670d01083c
pkgrel=1
pkgdesc="Essential files for building up your Rime configuration"
arch=('any')
url="https://github.com/rime/rime-essay-simp"
license=('LGPL')
source=("https://github.com/rime/rime-essay-simp/archive/$_commit/rime-essay-simp-$_commit.tar.gz")
sha512sums=('16717cd15ce589367e6555fafebc4176163932ce69ed27a2a98b82b75472428f8c6a0573f83723373d5ec1bbb8775bfa90e5b141faee935e49c3ba92eb9a8c69')

package() {
  cd $pkgname-$_commit
  install -Dm644 *.txt -t "$pkgdir"/usr/share/rime-data/
}
