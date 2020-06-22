# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tokei-bin
pkgver=12.0.0
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
sha256sums_i686=('2c6287fa3a7f451a75e88944ae2e9282c5416123f0dbf9a33c9ddfd8dcf0390f')
sha256sums_x86_64=('4653d1c8308f70e5bd87888f23ef2008de480e40be4f1aa3d7c16bd9c2ca449c')
sha256sums_aarch64=('34f97b97451bbf01c681e624ba11b1a3cd1766507b9acdd97249a43ef1e0a7a0')
sha256sums_arm=('9eaad069b2d500a57bac080dc4769c035e4312265bea0a82715acbb48e328b49')
sha256sums_armv7h=('fa1acbebf88ea1b6e1793679f309ed805c751a4fd7767746eedd753abf55140d')


package() {
  install -Dm755 "$srcdir/tokei" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENCE-MIT" -t "$pkgdir/usr/share/licenses/tokei"
}
