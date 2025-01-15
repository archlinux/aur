# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.5.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('97d100d496430d470052291d219f9312255bfd7243298f00e4e5db95ad0a9c5b')
sha256sums_aarch64=('97d100d496430d470052291d219f9312255bfd7243298f00e4e5db95ad0a9c5b')
sha512sums_x86_64=('6c79a1fc73610c0bd16e0baf4af05fef8f75c0aaa4d07fa5e89449760734c2cae046ccf2d9b746fd20450fc5d55eb05edd0c535ce65a24c11f2ba0248d7948ea')
sha512sums_aarch64=('6c79a1fc73610c0bd16e0baf4af05fef8f75c0aaa4d07fa5e89449760734c2cae046ccf2d9b746fd20450fc5d55eb05edd0c535ce65a24c11f2ba0248d7948ea')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


