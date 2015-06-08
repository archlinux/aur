# Maintainer: Nate Hart <nejthan@gmail.com>

pkgname=gcalert
pkgver=3.2
pkgrel=5
pkgdesc='Lightweight Google Calendar notifications'
arch=('any')
url=https://github.com/nejsan/gcalert
license=('GPL')
depends=('python' 'libnotify' 'python-google-api-python-client' 'python-notify2' 'python-dateutil')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/nejsan/gcalert/v$pkgver/gcalert")
sha256sums=('81ea48b99cbe0baa40295114ecf7c5c6a7acc4eeb774cc28ae4579f5bb70dd02')

prepare() {
  sed -i -e "1s/3$//" gcalert-$pkgver
}

package() {
  install -Dm755 gcalert-$pkgver "$pkgdir"/usr/bin/gcalert
}

# vim:set ts=2 sw=2 et:
