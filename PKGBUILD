# Maintainer: Mingye Chen <mingyechen82@gmail.com>
pkgname=fcitx5-solarized
pkgver=0.1
pkgrel=1
pkgdesc="Solarized color theme for Fcitx5"
arch=('any')
url="https://github.com/mingyech/fcitx5-solarized"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1753a089b0ea55858bb6d4f9a5252fc9ec4323dd77704a80656f43109f65b22a')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/fcitx5/themes/
  cp -r solarized-dark solarized-light "$pkgdir"/usr/share/fcitx5/themes/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
