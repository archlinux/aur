# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=18.0
pkgrel=1
pkgdesc='HTML and PDF documentation for Erlang'
arch=('any')
url='http://www.erlang.org/doc/'
license=('custom')
source=("http://www.erlang.org/download/otp_doc_html_${pkgver}.tar.gz")
sha256sums=('e5a766f68406f5025f921ec32e8959937189ed1245e24b03a74156a8898b03b2')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
