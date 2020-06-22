# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tokei-bin
pkgver=12.0.2
pkgrel=1
pkgdesc="Display statistics about your code"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv7h')
url="https://github.com/XAMPPRocky/tokei"
license=('apache' 'MIT')
provides=('tokei')
conflicts=('tokei')
source=("https://raw.githubusercontent.com/XAMPPRocky/tokei/master/LICENCE-MIT")
source_i686=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-i686-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-aarch64-unknown-linux-gnu.tar.gz")
source_arm=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-arm-unknown-linux-gnueabi.tar.gz")
source_armv7h=("https://github.com/XAMPPRocky/tokei/releases/download/v$pkgver/tokei-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('SKIP')
sha256sums_i686=('e5e7fb6773d6b88e1ae974b251c8292c342e0055d3c9fa200dc79ba63f5d455a')
sha256sums_x86_64=('9a4c63788d017a7a28a65dd5188f2387875617416c68b6c449a39f6d3b33d186')
sha256sums_aarch64=('1db9b3dbae51659a4609bdfad429303dac6015181368e109570beb77b1eef6e8')
sha256sums_arm=('bf958c36870e2f56f4213d9b3578ef03fdf415eb85355494402dce5f2692627f')
sha256sums_armv7h=('1f9c316d7ca8742e623bc5db71d47c52ed10c7ac4accbf74234291cd7e370d6f')


package() {
  install -Dm755 "$srcdir/tokei" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENCE-MIT" -t "$pkgdir/usr/share/licenses/tokei"
}
