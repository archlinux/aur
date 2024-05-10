# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=26.2.5
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=(any)
url='http://erlang.org/doc/'
license=(custom)
source=("https://github.com/erlang/otp/releases/download/OTP-$pkgver/otp_doc_html_$pkgver.tar.gz")
b2sums=('2292745354b886beada8b26c2cf4c1fd43597829ced572adb9ca3412d9b82d9c97c8b543f4330496ab11be3fee0d80aea285019af1d5d302a4346cf05cbb3560')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
