# Based on AUR2 package from Sébastien Luttringer <seblu@aur.archlinux.org>
# Maintainer: Nils Czernia <nils [at] czserver.de

pkgname=python2-shout
pkgver=0.2.1
pkgrel=1
pkgdesc='Python2 bindings for libshout'
arch=('i686' 'x86_64')
url='http://www.icecast.org'
license=('LGPL2')
depends=('libshout' 'python2')
source=("http://downloads.us.xiph.org/releases/libshout/shout-python-$pkgver.tar.gz")
md5sums=('864cfecc2474590470fcce750416b7d3')

package() {
  cd shout-python-$pkgver
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 ft=sh et:
