# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=4.0.1
pkgrel=1
pkgdesc="Package, distribute, and update any app for Linux and IoT."
arch=('any')
url="https://snapcraft.io"
license=('GPL')
depends=('python-apt' 'python-requests-oauthlib' 'python-ssoclient' 'python-progressbar'
         'python-requests-toolbelt' 'python-petname' 'python-jsonschema' 'python-yaml'
         'python-magic' 'python-docopt' 'python-tabulate' 'python-pymacaroons'
         'python-simplejson' 'python-libarchive-c' 'python-debian' 'python-pysha3'
         'python-requests-unixsocket' 'python-pylxd' 'python-pyelftools')
makedepends=('python-setuptools')
optdepends=('lxd')
options=(!emptydirs)
source=("https://github.com/snapcore/snapcraft/archive/${pkgver}.tar.gz")
sha256sums=('70fa9ebec56d0050010712f691aa5a88b7067d7c162c0fa5a3dc0bcb11beb9ad')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
