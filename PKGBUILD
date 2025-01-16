# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.5.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('c86ff9c6424c12f758eb5dd08259354c0a84084708f26485544f45287442497a')
sha256sums_aarch64=('c86ff9c6424c12f758eb5dd08259354c0a84084708f26485544f45287442497a')
sha512sums_x86_64=('bc838107afa992519416fd92556954a1398c2d28faa27c7f80b57e5c5f12272393246f4c1446998a100bb4bc909f31c7058d1fa583e7863537ba98572b7a1113')
sha512sums_aarch64=('bc838107afa992519416fd92556954a1398c2d28faa27c7f80b57e5c5f12272393246f4c1446998a100bb4bc909f31c7058d1fa583e7863537ba98572b7a1113')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


