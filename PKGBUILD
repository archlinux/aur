# $Id$
# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

pkgname=torrents_dispatcher
pkgver=0.0.3
pkgrel=1
pkgdesc='Dispatch your torrents between multiple torrent clients'
arch=('any')
url='https://github.com/Anthony25/torrents_dispatcher'
license=('BSD')
depends=('python-appdirs' 'python-argparse' 'python-bencodepy' 'python-setuptools')
source=("https://github.com/Anthony25/torrents_dispatcher/archive/${pkgver}.tar.gz")
sha256sums=('d5ec105578610e98f0e8c5a175e7d9622146cbef66d67d61ace2804880353ab5')

build() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py build
}

package() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
