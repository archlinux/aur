# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=21.0
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://erlang.org/doc/'
license=('custom')
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz") # no https available
sha256sums=('fcc10885e8bf2eef14f7d6e150c34eeccf3fcf29c19e457b4fb8c203e57e153c')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
