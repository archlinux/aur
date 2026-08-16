# Maintainer: Xuepoo (CI) <xuepoofoter@gmail.com>
pkgname=sigil-wm-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Invisible structural watermark for images (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sigil"
license=('Apache-2.0')
_arch="x86_64"
[ "$CARCH" = "aarch64" ] && _arch="aarch64"
source_x86_64=("sigil-$pkgver::https://github.com/Xuepoo/sigil/releases/download/v$pkgver/sigil-linux-x86_64.tar.gz")
source_aarch64=("sigil-$pkgver::https://github.com/Xuepoo/sigil/releases/download/v$pkgver/sigil-linux-aarch64.tar.gz")
sha256sums_x86_64=('7e9298be6b3163d655c306fdbdf8d1c1ef338cc7aaa3ddf2b35ef440e643948a')
sha256sums_aarch64=('7e9298be6b3163d655c306fdbdf8d1c1ef338cc7aaa3ddf2b35ef440e643948a')

package() {
  install -Dm755 "sigil" "$pkgdir/usr/bin/sigil"
}
