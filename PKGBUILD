# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=27.0
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(Apache-2.0)
source=("https://github.com/erlang/otp/releases/download/OTP-$pkgver/otp_doc_html_$pkgver.tar.gz")
b2sums=('bae1425e3b43608c59975c7936e3e250ae9606acce34a7168c2ef1aba60a2956858e3a5cb4412f8ff937c93821110eae5f0d71b9378cce86d9ad9810f70510dc')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
}
