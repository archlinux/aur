# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=ctrsigcheck-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Parse and verify various file formats used by the Nintendo 3DS, also known as CTR"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/connesc/ctrsigcheck"
license=('ISC')
provides=('ctrsigcheck')
conflicts=('ctrsigcheck')
source_i686=("ctrsigcheck_i686.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_386.tar.gz")
source_x86_64=("ctrsigcheck_x86_64.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_amd64.tar.gz")
source_arm=("ctrsigcheck_arm.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("ctrsigcheck_armv6h.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("ctrsigcheck_armv7h.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("ctrsigcheck_aarch64.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_arm64.tar.gz")
sha256sums_i686=('9294dd550f2e90413e2e8aab09ebcfa1264b6c12dcf8952a1948bf157834ea9b')
sha256sums_x86_64=('a65f990aae14619e17ef84b01e9dc3cf8c653b1adbef23517ab3f5d0e84afb8d')
sha256sums_arm=('4be61e15eac2fce4838b58a43dbb5103701fa8d277880be3597b4e13d71ef7dd')
sha256sums_armv6h=('9173dffe967bb265c93773995e594a246cd9b8163a2dc554d1cfa0ec329c2eda')
sha256sums_armv7h=('70d39f403de692d6c9df944da6386f0a40adee4a150d4a97a29d884b514802e1')
sha256sums_aarch64=('23e533a4e7c166020fee127b8d60a214789f6c05ebbfc648f3bff88534af6a76')

package() {
  install -D -m755 ctrsigcheck "$pkgdir/usr/bin/ctrsigcheck"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
