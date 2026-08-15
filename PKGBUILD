# Maintainer: Xuepoo (CI) <xuepoofoter@gmail.com>
pkgname=sigil-wm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Invisible structural watermark for images (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sigil"
license=('Apache-2.0')
_arch="x86_64"
[ "$CARCH" = "aarch64" ] && _arch="aarch64"
source=("sigil-$pkgver::https://github.com/Xuepoo/sigil/releases/download/v$pkgver/sigil-linux-${_arch}.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "sigil" "$pkgdir/usr/bin/sigil"
}
