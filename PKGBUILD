# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="The JavaScript playgroundfor your desktop, Explore and experiment with JavaScript and TypeScript, visualise your ideas and get instant feedback as you type."
arch=("x86_64" "aarch64")
url="https://github.com/lukehaas/RunJS"
license=("Commercial")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_arm64.deb")
sha256sums_x86_64=('8a2d684ac0d774d4cbd83e6315efa30ad6b304f45fb030921c9c4a75c326e61e')
sha256sums_aarch64=('8a2d684ac0d774d4cbd83e6315efa30ad6b304f45fb030921c9c4a75c326e61e')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
