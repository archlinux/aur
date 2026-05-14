pkgname=vectomancy-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="Image-to-Equation Converter CLI (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/vectomancy"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
provides=('vectomancy')
conflicts=('vectomancy')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Xuepoo/vectomancy/v$pkgver/LICENSE")
source_x86_64=("https://github.com/Xuepoo/vectomancy/releases/download/v$pkgver/vectomancy-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/vectomancy/releases/download/v$pkgver/vectomancy-linux-aarch64")

sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "$srcdir/vectomancy-linux-$CARCH" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
