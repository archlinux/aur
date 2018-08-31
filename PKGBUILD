# Maintainer: Zirak <zirakertan at gmail dot com>
pkgname=ttf-ia-writer-duospace
pkgver=1.0
_commitid=55edf60f544078ab1e14987bc67e9029a200e0eb
pkgrel=1
pkgdesc="iA Writer Duospace font in ttf"
url=https://github.com/iaolo/iA-Fonts
arch=('any')
license=('custom')
_tarname=ia-writer-duospace-$_commitid
source=("$_tarname.tar.gz::$url/archive/$_commitid.tar.gz")
sha256sums=('9645212c27f0fac9a31d85b77483d46825af5c841875938005acd5117b5764d9')

package() {
  echo hello
  echo `ls`
  cd "$srcdir/iA-Fonts-$_commitid/iA Writer Duospace"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF" -m644 "TTF (PC)"/*.ttf
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
