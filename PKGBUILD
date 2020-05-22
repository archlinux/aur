# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=ctrsigcheck-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Parse and verify various file formats used by the Nintendo 3DS, also known as CTR"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/connesc/ctrsigcheck"
license=('ISC')
provides=('ctrsigcheck')
conflicts=('ctrsigcheck')
source_i686=("ctrsigcheck_${pkgver}_i686.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_386.tar.gz")
source_x86_64=("ctrsigcheck_${pkgver}_x86_64.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_amd64.tar.gz")
source_arm=("ctrsigcheck_${pkgver}_arm.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("ctrsigcheck_${pkgver}_armv6h.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("ctrsigcheck_${pkgver}_armv7h.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("ctrsigcheck_${pkgver}_aarch64.tar.gz::https://github.com/connesc/ctrsigcheck/releases/download/v$pkgver/ctrsigcheck_${pkgver}_linux_arm64.tar.gz")
sha256sums_i686=('b2cacfe9e93bc13679b920e230733a329c30b9e26a1cb216a6718309b34ae831')
sha256sums_x86_64=('845714007ee45ed41e26b69de2215bb0c7ebdb3cd791376a12a67c1f623a1f2f')
sha256sums_arm=('de55337ae1a499d87f8ffb3ebe0e5635ac59407e3d9cc7e8176be9e2f1909d85')
sha256sums_armv6h=('8f2950ca66dca143716075cb7cac93f42bc284c72ea9c313f2b3ade5491a2ed7')
sha256sums_armv7h=('446c7590ae601b240f902a26efb67e0930f3edf4d04399e85068e9cfa4070987')
sha256sums_aarch64=('3127680ae29f4e9ff6f4629a696ad29bb1a258d2fc1f9a51196aaaf416d65540')

package() {
  install -D -m755 ctrsigcheck "$pkgdir/usr/bin/ctrsigcheck"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
