# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=3.0.3
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
sha256sums_x86_64=('9bf8083dbda0279a1c779c10c28ebfcfa7278e7479ffba316a5986ab97311a1e')
sha256sums_aarch64=('9bf8083dbda0279a1c779c10c28ebfcfa7278e7479ffba316a5986ab97311a1e')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
