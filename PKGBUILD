# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.6.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('a065b9892e56c73d29203223e832ac0a643265ab2db339b2e42b7badb0ffd963')
sha256sums_aarch64=('a065b9892e56c73d29203223e832ac0a643265ab2db339b2e42b7badb0ffd963')
sha512sums_x86_64=('aeb462f8a3d6ab33bbb864e3f9ab2518c2f097cea81d69fe23f4789b0648d299003cf9e19a5918c6c4e91bf61ba1e9eaf0b96bd4e740353e930aabf92c377987')
sha512sums_aarch64=('aeb462f8a3d6ab33bbb864e3f9ab2518c2f097cea81d69fe23f4789b0648d299003cf9e19a5918c6c4e91bf61ba1e9eaf0b96bd4e740353e930aabf92c377987')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


