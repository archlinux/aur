# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-amstelvar
pkgver=20220321
pkgrel=1
_commit=29db3945bf0ef6937f308ba240767b32ac2a474f
pkgdesc="Parametric variable font by David Berlow"
arch=('any')
url="https://github.com/googlefonts/amstelvar"
license=('custom:OFL')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.zip")
sha256sums=('e09511d8cfdbce530ca240a5999af6ebdbe17a44ceed4e04bc5115d3de7777d9')

package() {
  cd amstelvar-*/

  install -Dm644 fonts/Amstelvar-Italic*.ttf "$pkgdir"/usr/share/fonts/TTF/Amstelvar-Italic.ttf
  install -Dm644 fonts/Amstelvar-Roman*.ttf "$pkgdir"/usr/share/fonts/TTF/Amstelvar-Roman.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
