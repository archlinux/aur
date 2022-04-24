# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=24.0
pkgrel=2
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(custom)
source=("https://erlang.org/download/otp_doc_html_$pkgver.tar.gz")
b2sums=('8a9fe3acb4cc13691e16c477cf89e8298df1a99bbe6a6c9e59e3c34248ecdc21077835951087b5a5bbb23ddb28f3bd7ab8b058fe64ce56c342b825a6c0ef8948')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
