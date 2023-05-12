# $Id$
# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

pkgname=torrents_dispatcher
pkgver=0.0.6
pkgrel=4
pkgdesc='Dispatch your torrents between multiple torrent clients'
arch=('any')
url='https://github.com/Anthony25/torrents_dispatcher'
license=('BSD')
depends=('python-appdirs' 'python-bencodepy' 'python-setuptools')
source=("https://github.com/Anthony25/torrents_dispatcher/archive/${pkgver}.tar.gz")
sha256sums=('fa2f0cb2c1b574edf8b461971e4dd576c89d76ca5343a15f924c21da39c64c95')

build() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py build
}

package() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
