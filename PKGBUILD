# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-desktop-bin
_pkgname=katana-desktop
pkgver=1.1.6
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
sha256sums_x86_64=('8c250ba6246a48b25e19476e7dc1923d6c2fb3edb9adf3dab671ba0ee670ec9e')
sha256sums_aarch64=('658062f3b3fd54c58287578a50e6159f8d6ac02f2e0a717ca0f656a54eabe670')

package() {
  cp -a usr "$pkgdir/"
}
