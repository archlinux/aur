# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-desktop-bin
_pkgname=katana-desktop
pkgver=1.1.5
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
sha256sums_x86_64=('d712c69ae26a3ce80c77456d76c51f788bc9b5bf72821451b146994ac78c6a39')
sha256sums_aarch64=('90c68a6b75be8d899c7d59777cf480326d85d3526d0f8e118934f05f5bb7d524')

package() {
  cp -a usr "$pkgdir/"
}
