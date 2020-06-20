# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=23.0
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(custom)
source=("https://erlang.org/download/otp_doc_html_$pkgver.tar.gz")
sha256sums=('4da19f0de96d1c516d91c621a5ddf20837303cc25695b944e263e3ea46dd31da')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
