# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=17.3
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://www.erlang.org/doc/'
license=('custom')
source=("http://www.erlang.org/download/otp_doc_html_${pkgver}.tar.gz")
sha256sums=('bd8278b34f610d6025549640d4e03d79d2a69d7129ea230c0d71d7e6b231f5b3')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
