# Maintainer: Colin Keenan <colinnkeenan at gmail dot com>

pkgname=open_choose
pkgver=1.4
pkgrel=2
pkgdesc="'catfish --wrapper=open_choose' for open-with dialog when open file in catfish"
arch=('any')
url="https://github.com/colinkeenan/open_choose"
license=('GPL')
depends=('zenity' 'perl-file-mimeinfo')
install=${pkgname}.install

source=("https://raw.githubusercontent.com/colinkeenan/${pkgname}/v${pkgver}/${pkgname}")
md5sums=('9b40ab463a80019dfe58856f0190c784')

package() {
  install -D -m755 open_choose "$pkgdir/usr/bin/open_choose"
}
