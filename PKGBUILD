# SPDX-License-Identifier: 0BSD

pkgname=pidgin-pending_notifications
pkgver=0.0
pkgrel=1
license=('0BSD')
pkgdesc='Flash a LED on pending notifications'
depends=(pidgin)
arch=('any')
url='https://gitlab.com/vicencb/pending_notifications'
source=("${url}/-/archive/${pkgver}/pending_notifications-${pkgver}.tar.bz2")
md5sums=('SKIP')

build() {
  cd "${srcdir}/pending_notifications-${pkgver}"
  make
}

package() {
  cd "${srcdir}/pending_notifications-${pkgver}"
  make DESTDIR="$pkgdir" install
}
