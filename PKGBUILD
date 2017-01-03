# Maintainer: M0Rf30
# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.

pkgname='wifiphisher'
pkgver=1.2
pkgrel=1
groups=('blackarch' 'blackarch-wireless' 'blackarch-social')
pkgdesc='Fast automated phishing attacks against WPA networks.'
arch=('any')
url='https://github.com/sophron/wifiphisher'
license=('MIT')
depends=('python2' 'python2-httplib2' 'python2-jinja2' 'python2-markupsafe' 'python2-pyric' 'scapy' 'aircrack-ng' 'dnsmasq' 'hostapd' 'net-tools')
makedepends=('git')
source=("https://github.com/sophron/wifiphisher/archive/v$pkgver.tar.gz"
	$pkgname.sh)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

md5sums=('e7df0895e57432e24bc27143c378fcf9'
         '20fc8c517c5e85c8a47e2372beecd83c')
