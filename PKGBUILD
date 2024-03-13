pkgname=rime-kaomoji
pkgver=0.0.0.20230825
_commit=e2b64996bf26e409466a1de8a904364b634e6307
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
