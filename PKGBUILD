# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-essay-simp
pkgver=0.0.0.20200521
_commit=024d2002107067c4849a0bcffe00c94875e7c195
pkgrel=1
pkgdesc="Essential files for building up your Rime configuration"
arch=('any')
url="https://github.com/rime/rime-essay-simp"
license=('LGPL')
source=("https://github.com/rime/rime-essay-simp/archive/$_commit/rime-essay-simp-$_commit.tar.gz")
sha512sums=('0708f4f610903391be95c7881f56fff68f37e58c076002d92bfeff38081c1752d1b420429602b2c6e540f40214e9b6c1489ef4bfedbf74759621784140a3b650')

package() {
  cd $pkgname-$_commit
  install -Dm644 *.txt -t "$pkgdir"/usr/share/rime-data/
}
