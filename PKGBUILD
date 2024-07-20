# Maintainer: Felipe Alfonso González <f.alfonso@res-ear.ch>
pkgname=connmaster
pkgver=v.0.0.1
pkgrel=1
pkgdesc="ConnWifiMaster is a Python (PyQt5) app for managing WiFi on Arch Linux with ConnMan."
arch=('x86_64')
url="https://github.com/felipealfonsog/ConnWifiMaster"
license=('MIT')
depends=('connman' 'python-pyqt5' 'python')

source=("https://github.com/felipealfonsog/ConnWifiMaster/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgver"
}

package() {
  cd "$srcdir/$pkgver"
  install -Dm755 connman "$pkgdir/usr/bin/connman"
}
