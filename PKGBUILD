# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.8.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('4e0fecb7729bf6d20482d45daf93ace35864dd5e311d4ef6ba448289e439d901')
sha256sums_aarch64=('4e0fecb7729bf6d20482d45daf93ace35864dd5e311d4ef6ba448289e439d901')
sha512sums_x86_64=('3694db18d1ea2d85eb0c36c8bf40143d79e9d7f21d7ce6cba94e8a97408c4c2b9b3adf8b230edfbf77a44e324e90b85b9a1a816d527f9c2f3aaf41d71cd9fdd1')
sha512sums_aarch64=('3694db18d1ea2d85eb0c36c8bf40143d79e9d7f21d7ce6cba94e8a97408c4c2b9b3adf8b230edfbf77a44e324e90b85b9a1a816d527f9c2f3aaf41d71cd9fdd1')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


