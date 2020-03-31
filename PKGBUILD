# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nebula-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A scalable overlay networking tool"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/slackhq/nebula"
license=('MIT')
depends=('glibc')
provides=('nebula')
conflicts=('nebula')
source=("https://raw.githubusercontent.com/slackhq/nebula/master/LICENSE")
source_i686=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-386.tar.gz")
source_x86_64=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-amd64.tar.gz")
source_aarch64=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm64.tar.gz")
source_arm=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm-5.tar.gz")
source_armv6h=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm-6.tar.gz")
source_armv7h=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm-7.tar.gz")
sha256sums=('aefd0cce553f24945ce1c692c3c4f9fda581f078ba82977845715cd18565b3bd')
sha256sums_i686=('03ed18d8dceae65d8c353d81b0e01a07fcacdb38b9c85efde7d04a120177f9e2')
sha256sums_x86_64=('3455a6c51d904b017d9b6e4bd99d3fbd825805ee605fcef017036f77b20cc581')
sha256sums_aarch64=('dd7f2aa7f4d6d1ca6d2cf959071c163c02cbfe67fe84725eacf15a1b7e405fc1')
sha256sums_arm=('ff193ffa22d7ae62934a43ca435cd3ac18ad76f13e4d3ce6e9cfcf2278cf5cc2')
sha256sums_armv6h=('35a36a0ddcc2c6d7816e44ae425992a8005e7f3c27786769ecdd4adb09cff8af')
sha256sums_armv7h=('a8823948dd7eef17a96eb9272eb4df7ecb318732bb28bd7ddb57258572e2365a')


package() {
  install -Dm755 "$srcdir/nebula"{,-cert} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/nebula"
}
