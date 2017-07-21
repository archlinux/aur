# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=20.0
pkgrel=2
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://erlang.org/doc/'
license=('custom')
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz") # no https available
sha256sums=('1ab25110b148ce263d6e68cd5a3b912299b6066cfcd9d2fce416a4e9b7d2543a')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
