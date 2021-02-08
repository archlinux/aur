# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="RunJS is an JavaScript playground that auto-evaluates your code as you type and outputs the results to a console pane"
arch=("x86_64")
url="https://github.com/lukehaas/RunJS"
license=("MIT")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
sha256sums=("0c8e4edae2590563acd532f2145b32bc36c20a5b7c46f83cb55a54de59626f48")

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
