# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=21.1
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://erlang.org/doc/'
license=('custom')
source=("http://erlang.org/download/otp_doc_html_$pkgver.tar.gz") # no https available
sha256sums=('85333f77ad12c2065be4dc40dc7057d1d192f7cf15c416513f0b595583f820ce')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
