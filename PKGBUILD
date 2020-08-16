# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-symbolic-simp
pkgver=0.0.0.20200813
_commit=c35e657952c7333d43fe1ed7403d507f282316f8
pkgrel=1
pkgdesc="Symbolic input for rime (Simplified Chinese version)"
arch=('x86_64')
url="https://github.com/sgalal/rime-symbolic-simp"
license=('CC0')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
md5sums=('dc8e6795bb3bb086483c331ed4ae7a68')

package() {
  cd $pkgname-$_commit
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
