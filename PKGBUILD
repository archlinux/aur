# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=4.0.7
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
sha256sums=('d15e82ca72e6b8f527c83de217467646fcaba0bbe64ed6caaa2f3e3fe3404ffd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
