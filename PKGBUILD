# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tokei-bin
pkgver=12.1.2
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
sha256sums_i686=('e80cebc6ad34a2f06588d0d3ba8f1041b8bfeb3dfca4c7d288a41cee6b336f89')
sha256sums_x86_64=('331e77046935d655dce8d97ebb943fcc7e9684586dadf3d197f3df5e760cd31b')
sha256sums_aarch64=('ef514fd12cfc3ee2d1725e5ecb866ee1123163004879ec285b22f3323389ebe2')
sha256sums_arm=('4876ef304d58b09dc5cee310bc18b273c3415de4e1c53595e993f9dd7aca10ff')
sha256sums_armv7h=('cfd9b2cf23fbe4f8693a87f1e7652126205e0ef3c79c05c38dfaff238d557e71')


package() {
  install -Dm755 "$srcdir/tokei" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENCE-MIT" -t "$pkgdir/usr/share/licenses/tokei"
}
