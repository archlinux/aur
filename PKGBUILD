# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tokei-bin
pkgver=12.0.4
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
sha256sums_i686=('07d59e867ec82ae8b6753986508dd2c6d4d515b84772e93d58c8785d83ab9b56')
sha256sums_x86_64=('2543cd69b7f478bbadd605475b257b4a2cc9dab01ca2fc38ee6a86d416d65b97')
sha256sums_aarch64=('6faaff8bd4bc255ae08bde582691bc6022dca059c48cf08fbcad006a2def1fbf')
sha256sums_arm=('a6da30a3f3b88d18bc045fb309ea698ab1a284d7d476f3cd8f8db806cbbec52a')
sha256sums_armv7h=('7353f1111ae680cb75fc89a4d5db2057675d6d3b147e0af98bdc9c060b74fd1e')


package() {
  install -Dm755 "$srcdir/tokei" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENCE-MIT" -t "$pkgdir/usr/share/licenses/tokei"
}
