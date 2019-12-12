# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=22.2
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(custom)
# HTTPS is not available
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz")
sha256sums=('09d41810d79fafde293feb48ebb249940eca6f9f5733abb235e37d06b8f482e3')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
