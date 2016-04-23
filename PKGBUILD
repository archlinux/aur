# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=18.3
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://www.erlang.org/doc/'
license=('custom')
source=("http://www.erlang.org/download/otp_doc_html_${pkgver}.tar.gz")
sha256sums=('8fd6980fd05367735779a487df107ace7c53733f52fbe56de7ca7844a355676f')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
