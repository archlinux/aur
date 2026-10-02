# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-desktop-bin
_pkgname=katana-desktop
pkgver=1.1.0
pkgrel=1
pkgdesc="Unofficial desktop client for Nonograms Katana user puzzles (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ArkadyBuryakov/katana-desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libsoup3' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('75af05b628aa1b2e810f977f6c8ec83e67afd835a6c969cb70c3951dcc825c95')
sha256sums_aarch64=('09f4c8f848653a016632e2f9658008766100a5fcd2ec0b1d8e847b1b22885a32')

package() {
  cp -a usr "$pkgdir/"
}
