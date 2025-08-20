# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.9.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('1ccf1c5fcde9b3ab72276fbd2faa5f276ab0d126856a405ad42a61d23c7d2e7b')
sha256sums_aarch64=('1ccf1c5fcde9b3ab72276fbd2faa5f276ab0d126856a405ad42a61d23c7d2e7b')
sha512sums_x86_64=('a99e71ff8c4792ba6a8ba09bed28d74bf52a642450db62bc2397b629abc49c434081a51464bed5e872df5bcbaa9bd438a71a5deb37f23d49f25f80831267836e')
sha512sums_aarch64=('a99e71ff8c4792ba6a8ba09bed28d74bf52a642450db62bc2397b629abc49c434081a51464bed5e872df5bcbaa9bd438a71a5deb37f23d49f25f80831267836e')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


