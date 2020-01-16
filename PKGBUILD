# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=3.9.5
pkgrel=1
pkgdesc="Build Ubuntu snappy packages."
arch=('any')
url="http://snapcraft.io"
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
sha256sums=('b30ce954b6cf89954504e166ae795c3b46c962bd16b9868d50476192ac888d39')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
