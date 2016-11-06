# $Id$
# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

pkgname=torrents_dispatcher
pkgver=0.0.5
pkgrel=1
pkgdesc='Dispatch your torrents between multiple torrent clients'
arch=('any')
url='https://github.com/Anthony25/torrents_dispatcher'
license=('BSD')
depends=('python-appdirs' 'python-argparse' 'python-bencodepy' 'python-setuptools')
source=("https://github.com/Anthony25/torrents_dispatcher/archive/${pkgver}.tar.gz")
sha256sums=('cd9b9833b7822ac3eea469821a8a41d4ebf3ae89404e3b0c4a9d6890d4ebbede')

build() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py build
}

package() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
