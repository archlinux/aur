# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=3.9
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
sha256sums=('ce8a3949ea2009d0f0a445d91fbacf38d9dd383942f74d51ebd3fb73175c7e88')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
