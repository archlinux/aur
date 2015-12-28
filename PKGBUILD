# $Id$
# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

pkgname=torrents_dispatcher
pkgver=0.0.4
pkgrel=1
pkgdesc='Dispatch your torrents between multiple torrent clients'
arch=('any')
url='https://github.com/Anthony25/torrents_dispatcher'
license=('BSD')
depends=('python-appdirs' 'python-argparse' 'python-bencodepy' 'python-setuptools')
source=("https://github.com/Anthony25/torrents_dispatcher/archive/${pkgver}.tar.gz")
sha256sums=('e847cd517c6b1fc47d8d42b5bda1ee379e8eb079d5f363bcd9467a088fe40086')

build() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py build
}

package() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
