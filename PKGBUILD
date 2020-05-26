# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=ctrsigcheck-bin
pkgver=0.2.1
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
sha256sums_i686=('f09001cd44d6b156d8ad4b885fb27747c8f7d8e5925c8365d5a8e618d74c107f')
sha256sums_x86_64=('839d7223a28ff13a5f278d6317270ad2cedc5aa86fcdf0f10c69af163d516216')
sha256sums_arm=('00c3778df4b8a3b3b284345a97bfa36d65e4786000c63a38751bc4492315cf10')
sha256sums_armv6h=('31c8f69e39b8a1d02e4d672b8f7e7de0d57bf3f37f5c0bcd9e3d8d7f6d1e1996')
sha256sums_armv7h=('d425b015ad92863414278d502eeaa4f1271d090728f42355a5ea1768b6b611de')
sha256sums_aarch64=('77e617de7dd511f0e69fa825ac4cbe806d9db9866e8b80497c62550516c75851')

package() {
  install -D -m755 ctrsigcheck "$pkgdir/usr/bin/ctrsigcheck"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
