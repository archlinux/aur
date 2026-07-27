# Maintainer: 1ay1 <https://github.com/1ay1>
# Generated automatically by .github/workflows/release.yml — do not edit by hand.
pkgname=neowall-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="GPU shader wallpapers for Wayland and X11 (prebuilt binary)"
arch=('x86_64')
url="https://github.com/1ay1/neowall"
license=('MIT')
depends=('wayland' 'mesa' 'libpng' 'libjpeg-turbo' 'libx11' 'libxrandr' 'libxkbcommon')
provides=('neowall')
conflicts=('neowall' 'neowall-git')
options=(!strip !debug)
source=("neowall-$pkgver-x86_64.tar.gz::https://github.com/1ay1/neowall/releases/download/v0.5.4/neowall-linux-x86_64-arch.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/1ay1/neowall/v0.5.4/LICENSE")
sha256sums=('c5993a3f71644e0df8e1cd8be4e352c04c4a8e93001342a5da128a3660562031'
            'SKIP')

package() {
  install -Dm755 "$srcdir/neowall" "$pkgdir/usr/bin/neowall"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
