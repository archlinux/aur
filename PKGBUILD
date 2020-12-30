# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tokei-bin
pkgver=12.1.1
pkgrel=1
pkgdesc="Display statistics about your code"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv7h')
url="https://github.com/XAMPPRocky/tokei"
license=('apache' 'MIT')
provides=('tokei')
conflicts=('tokei')
source=("https://raw.githubusercontent.com/XAMPPRocky/tokei/master/LICENCE-MIT")
source_i686=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-i686-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-aarch64-unknown-linux-gnu.tar.gz")
source_arm=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-arm-unknown-linux-gnueabi.tar.gz")
source_armv7h=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('SKIP')
sha256sums_i686=('6381f1cfc3cde167674777cd6cf6999d116503f4b51ec70b66f2f8c4c9799b18')
sha256sums_x86_64=('3ac670c36f7fb62d4bc7f80cd599dd31f65cbfe6a760da875001769dcfb32a95')
sha256sums_aarch64=('880ffa0698c24918d934554d3ccdc16994c16edda82084539dab6407e13b06ea')
sha256sums_arm=('8533d314f53eeb580d7f555b3bcf4780abab384ff2159de347047e2a1e7600cf')
sha256sums_armv7h=('4d3dd2c3025f1347de38d457e28ad416c7d7e846e8f8b640804f3a12f55b11ab')


package() {
  install -Dm755 "$srcdir/tokei" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENCE-MIT" -t "$pkgdir/usr/share/licenses/tokei"
}
