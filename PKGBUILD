# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-symbolic
pkgver=0.0.0.20200813
_commit=b2c19f92dbbd00ecf63ad58bba3f9791afb4062f
pkgrel=1
pkgdesc="Symbolic input for rime"
arch=('x86_64')
url="https://github.com/sgalal/rime-symbolic"
license=('CC0')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
md5sums=('dddb0098d1379f39cdf0329681fbdbbf')

package() {
  cd $pkgname-$_commit
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
