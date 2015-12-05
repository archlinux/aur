# $Id$
# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

pkgname=torrents_dispatcher
pkgver=0.0.2
pkgrel=1
pkgdesc='Dispatch your torrents between multiple torrent clients'
arch=('any')
url='https://github.com/Anthony25/torrents_dispatcher'
license=('BSD')
depends=('python-appdirs' 'python-argparse' 'python-bencodepy' 'python-setuptools')
source=("https://github.com/Anthony25/torrents_dispatcher/archive/${pkgver}.tar.gz")
sha256sums=('013cd4e44bfb3b56acb77e62c6dba44630c15691842257de62b2e594030c8734')

build() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py build
}

package() {
  cd torrents_dispatcher-${pkgver}

  python3 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
