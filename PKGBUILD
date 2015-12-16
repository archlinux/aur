# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=3.5.3
pkgrel=1
pkgdesc="Tweak tool for MATE, a fork of mintDesktop"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-panel' 'python-configobj' 'python-gobject')
makedepends=('git' 'python-distutils-extra' 'python-setuptools')
source=("$pkgname-$pkgver::git+https://bitbucket.org/ubuntu-mate/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd $pkgname-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
