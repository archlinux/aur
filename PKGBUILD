# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=R15B03
pkgrel=1
pkgdesc='Set of HTML and PDF documentation for Erlang'
arch=('any')
url='http://www.erlang.org/doc/'
license=('custom')
source=("http://www.erlang.org/download/otp_doc_html_${pkgver}.tar.gz")
sha256sums=('00595ba3055a1282a18344467c865a416e05ef6e883c2702eded7ac40fc6c50c')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-* lib "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
