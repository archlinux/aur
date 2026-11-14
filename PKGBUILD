# Maintainer: 1ay1 <https://github.com/1ay1>
# Generated automatically by .github/workflows/release.yml — do not edit by hand.
pkgname=neowall-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="GPU shader wallpapers for Wayland and X11 (prebuilt binary)"
arch=('x86_64')
url="https://github.com/1ay1/neowall"
license=('MIT')
depends=('wayland' 'mesa' 'libpng' 'libjpeg-turbo' 'libx11' 'libxrandr' 'libxkbcommon')
provides=('neowall')
conflicts=('neowall' 'neowall-git')
options=(!strip !debug)
source=("neowall-$pkgver-x86_64.tar.gz::https://github.com/1ay1/neowall/releases/download/v0.9.0/neowall-linux-x86_64-arch.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/1ay1/neowall/v0.9.0/LICENSE")
sha256sums=('86670f469113a0b519a01e3ff60e0fa318a79669f02fc8f2c22322796eea8ee5'
            'SKIP')

package() {
  install -Dm755 "$srcdir/neowall" "$pkgdir/usr/bin/neowall"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
