# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=20.3
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://erlang.org/doc/'
license=('custom')
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz") # no https available
sha256sums=('8099b62e9fa24b3f90eaeda151fa23ae729c8297e7d3fd8adaca865b35a3125d')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
