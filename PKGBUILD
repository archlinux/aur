# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-docs
pkgver=R15B01
pkgrel=1
pkgdesc='Set of HTML and PDF documentation for Erlang'
arch=('any')
url='http://www.erlang.org/doc/'
license=('custom')
options=('docs')
source=("http://www.erlang.org/download/otp_doc_html_$pkgver.tar.gz")
md5sums=('7569cae680eecd64e7e5d952be788ee5')

package() {
  install -d "$pkgdir/usr/share/doc/erlang"
  cp -rf doc erts-5.9.1 lib "$pkgdir/usr/share/doc/erlang"
}
