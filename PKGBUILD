# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=git-test
pkgver=1.0.4
pkgrel=1
pkgdesc="Git extension to conveniently test all distinct versions"
arch=('any')
url="https://github.com/spotify/git-test"
license=('Apache')
depends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('48303af69ece2e1a0ea4b56f4ad5eb1404a4d8a14167343f26cb434999041c4f60f3275d80e2c8dc2c07b9d7d55ec65b941c377017212e4308cf2c48fe0b611b')

package() {
  cd "$pkgname-$pkgver"
  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname"

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
