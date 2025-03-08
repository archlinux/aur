# Maintainer: xpe-online <xpecnh2n@gmail.com>

pkgname=fcitx5-nord-pink
pkgver=1.0
pkgrel=2
pkgdesc="A pink Fcitx5 theme based on fcitx5-nord"
arch=('any')
url="https://github.com/xpe-online/fcitx5-nord-pink"
license=('MIT')
depends=('fcitx5')
makedepends=('git')
source=("git+https://github.com/xpe-online/fcitx5-nord-pink.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/fcitx5-nord-pink"

  install -dm755 "$pkgdir/usr/share/fcitx5/themes/Nord-Pink"

  cp -r Nord-Pink/* "$pkgdir/usr/share/fcitx5/themes/Nord-Pink/"
}
