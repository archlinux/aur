# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="RunJS is an JavaScript playground that auto-evaluates your code as you type and outputs the results to a console pane"
arch=("x86_64" "aarch64")
url="https://github.com/lukehaas/RunJS"
license=("Commercial")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_arm64.deb")
sha256sums_x86_64=('8372f4a810d4a022a7279397f6ae52d3d50e4e15083eec3781eec3fcb1479706')
sha256sums_aarch64=('8372f4a810d4a022a7279397f6ae52d3d50e4e15083eec3781eec3fcb1479706')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
