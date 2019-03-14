# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=21.3
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(custom)
# HTTPS is not available
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz")
sha256sums=('258b1e0ed1d07abbf08938f62c845450e90a32ec542e94455e5d5b7c333da362')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
