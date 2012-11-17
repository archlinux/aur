# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=R15B02
pkgrel=1
pkgdesc='Set of HTML and PDF documentation for Erlang'
arch=('any')
url='http://www.erlang.org/doc/'
license=('custom')
source=("http://www.erlang.org/download/otp_doc_html_${pkgver}.tar.gz")
md5sums=('36d91f123204f4c71a464985b1b2a375')

package() {
  install -d "${pkgdir}/usr/share/doc/erlang"
  cp -rf doc erts-* lib "${pkgdir}/usr/share/doc/erlang"
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
