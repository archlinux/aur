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
source_x86_64=("sigil-$pkgver::https://github.com/Xuepoo/sigil/releases/download/v$pkgver/sigil-linux-x86_64.tar.gz")
source_aarch64=("sigil-$pkgver::https://github.com/Xuepoo/sigil/releases/download/v$pkgver/sigil-linux-aarch64.tar.gz")
sha256sums_x86_64=('a92b772ac9b4704b89e2d1120767b691347d8633bd84dc4e7b614c4e4ca33cd9')
sha256sums_aarch64=('01b994f68921193d7618cc46d5e3b9c889ac7f171001ad7a3003af59590a3172')

package() {
  install -Dm755 "sigil" "$pkgdir/usr/bin/sigil"
}
