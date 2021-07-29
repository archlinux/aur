# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="RunJS is an JavaScript playground that auto-evaluates your code as you type and outputs the results to a console pane"
arch=("x86_64")
url="https://github.com/lukehaas/RunJS"
license=("Commercial")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
sha256sums=("fd121b4813e06f7593badfa01250f4600e0bdea2aff758095075e52f1e4c6ac0")

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
