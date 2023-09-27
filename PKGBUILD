# Maintainer: jinzhongjia <mail@nvimer.org>
pkgname=simple-fcitx5-theme
pkgver=0.0.1
pkgrel=1
url='https://bbs.deepin.org/post/223743'
pkgdesc='A simple theme for fcitx'
arch=('any')
license=('unknown')
conflicts=()
provides=()
replaces=()
source=('simple-theme.tar.gz')
sha256sums=('9984326249cbd4cc8dfc71cafe344caf13d0eeee685732b3bff28238af22d2cf')

package() {
  cd simple-theme
  install -dm755 "$pkgdir"/usr/share/fcitx5/themes/
  cp -r Simple-dark Simple-white "$pkgdir"/usr/share/fcitx5/themes/
}
