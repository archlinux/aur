# Maintainer: Leonel Zeballos <https://github.com/zzebnell>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=runjs-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="The JavaScript playground for your desktop, Explore and experiment with JavaScript and TypeScript, visualise your ideas and get instant feedback as you type."
arch=("x86_64" "aarch64")
url="https://github.com/lukehaas/RunJS"
license=("Commercial")
depends=("nss" "libxss" "libnotify" "libsecret" "libappindicator-gtk3" "util-linux-libs" "xdg-utils")
provides=("runjs")
conflicts=("runjs" "runjs-git")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/runjs_${pkgver}_arm64.deb")
sha256sums_x86_64=('677e3e18de6f36b58efba557788560b37071272cdf4345a066f4bd5810ccfec7')
sha256sums_aarch64=('e58561fe8ac9b82ea3c6811abefc5087d740398680f1180408985a76ad143cff')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
