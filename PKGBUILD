# Maintainer: M0Rf30
# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.

pkgname='wifiphisher'
pkgver=1.3
pkgrel=1
groups=('blackarch' 'blackarch-wireless' 'blackarch-social')
pkgdesc='Fast automated phishing attacks against WPA networks.'
arch=('any')
url='https://github.com/sophron/wifiphisher'
license=('MIT')
depends=('python2' 'python2-blessings' 'python2-pyric' 'python2-tornado' 'scapy' 'dnsmasq' 'hostapd' 'net-tools')
makedepends=('git')
source=("https://github.com/sophron/wifiphisher/archive/v$pkgver.tar.gz"
	$pkgname.sh)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

md5sums=('ddff26c8e062c540b4b3e8c67d2a1655'
         '20fc8c517c5e85c8a47e2372beecd83c')
