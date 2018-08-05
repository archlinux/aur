# SPDX-License-Identifier: 0BSD

pkgname=purple-libetpan_mail_check
pkgver=0.0
pkgrel=1
license=('0BSD')
pkgdesc='New mail notifications'
depends=(libpurple libetpan)
arch=('any')
url='https://gitlab.com/vicencb/libetpan_mail_check'
source=("${url}/-/archive/${pkgver}/libetpan_mail_check-${pkgver}.tar.bz2")
md5sums=('SKIP')

build() {
  cd "${srcdir}/libetpan_mail_check-${pkgver}"
  make
}

package() {
  cd "${srcdir}/libetpan_mail_check-${pkgver}"
  make DESTDIR="$pkgdir" install
}
