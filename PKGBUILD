# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=20.2
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://erlang.org/doc/'
license=('custom')
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz") # no https available
sha256sums=('7f5e7d4cd0c58e15d7d29231931c2a710f7f5fdfcb0ff8edb8142969520c4256')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
