# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.11.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('7f2e35eae851d8c9c23e85221a00fbd80822e8ae547d8ba949d56e136d10c31b')
sha256sums_aarch64=('7f2e35eae851d8c9c23e85221a00fbd80822e8ae547d8ba949d56e136d10c31b')
sha512sums_x86_64=('c684c4189c61a377b762ec51ffce8a0cdd2cf19900e393b753eecd52a3f722d81c7a8b9f85d569dd26e11abbbbd5a50addd727b606e42ac8f07e89c6a80fd4ad')
sha512sums_aarch64=('c684c4189c61a377b762ec51ffce8a0cdd2cf19900e393b753eecd52a3f722d81c7a8b9f85d569dd26e11abbbbd5a50addd727b606e42ac8f07e89c6a80fd4ad')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


