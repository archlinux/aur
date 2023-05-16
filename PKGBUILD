# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
provides=("rav1e=$pkgver")
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-sse4.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-aarch64.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('1a5d5e4b9387fbe4be685713c87e46311a6ddd5eeb06c8fa3a806ff9c8ac57e7')
sha256sums_aarch64=('c74e6de887aa6fa179ec9954dd63ee8b0fafca08b2fdefa181212aef9b52871e')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/rav1e"
}
