# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=25.3
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(custom)
source=("https://erlang.org/download/otp_doc_html_$pkgver.tar.gz")
b2sums=('0855e0a5d046c52c1c0799a58bcac7550c7d64acf5a4d981c7f15577f833782a1836bb6270c5b2685bbdb9112051940e70869c775221e44a19abb0902268d976')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
