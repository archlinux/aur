# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="The fastest and safest AV1 encoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
provides=('rav1e')
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-aarch64-linux.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('8372174ba45ca66a76bd43ffb03acb4ace5341cc9b38a15b21c0aff9f16e793d')
sha256sums_aarch64=('ede79db300b4c2cfd944505f4b0a4bad0c79f46708949cf4d03ef838826a6ba2')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rav1e"
  install -Dm644 "PATENTS" -t "$pkgdir/usr/share/licenses/rav1e"
}
