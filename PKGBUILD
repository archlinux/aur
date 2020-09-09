# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-essay-simp
pkgver=0.0.0.20200910
_commit=36f17e1f60899cb5bdfe1133b86fdeb37afc70be
pkgrel=1
pkgdesc="Essential files for building up your Rime configuration"
arch=('any')
url="https://github.com/rime/rime-essay-simp"
license=('LGPL')
source=("https://github.com/rime/rime-essay-simp/archive/$_commit/rime-essay-simp-$_commit.tar.gz")
sha512sums=('ae6740adf225e2d92e12a574bf77fba90e2ff1cbe34023970a10d7b008ddc98352d507c21bb839019ff1d04667e96716849cafd5be9d848c2ead91a63f522596')

package() {
  cd $pkgname-$_commit
  install -Dm644 *.txt -t "$pkgdir"/usr/share/rime-data/
}
