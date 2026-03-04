# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=28.4
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(Apache-2.0)
source=("https://github.com/erlang/otp/releases/download/OTP-$pkgver/otp_doc_html_$pkgver.tar.gz")
b2sums=('418fc4293aa36d20edb3f444104c877ebfdda50f157217aed77e5fa4ce3aa88d1f7b0299c5fc7e1a0076e40d3d9e846ddd10503cdf5adffc7fac78b9eeeabddb')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
}
