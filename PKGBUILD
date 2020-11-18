# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=1.12.2
pkgrel=1
pkgdesc="RunJS is an JavaScript playground that auto-evaluates your code as you type and outputs the results to a console pane"
arch=("x86_64")
url="https://github.com/lukehaas/RunJS"
license=("MIT")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v1.12.2/runjs_${pkgver}_amd64.deb")
sha256sums=("bd7ac633f355dfcad718d984ad3dc4fa8919dc8b8cc73c2e8544916c57e88393")

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
