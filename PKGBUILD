pkgname=rime-kaomoji
pkgver=0.0.0.20261116
_commit=94426b5476ae066a9efa8853823797eb2666e00f
pkgrel=1
pkgdesc="Kaomoji support for rime"
arch=('any')
url="https://github.com/Freed-Wu/rime-kaomoji"
license=('LGPL')
makedepends=('git')
source=("git+$url#commit=$_commit")
sha512sums=('SKIP')

package() {
  cd $pkgname
  install -Dm644 kaomoji_suggestion.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
