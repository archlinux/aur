# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=2.38
pkgrel=1
pkgdesc="Build Ubuntu snappy packages."
arch=('any')
url="http://snapcraft.io"
license=('GPL')
depends=('python-apt' 'python-requests-oauthlib' 'python-ssoclient' 'python-progressbar'
         'python-requests-toolbelt' 'python-petname' 'python-jsonschema' 'python-yaml'
         'python-magic' 'python-docopt' 'python-tabulate' 'python-pymacaroons-pynacl'
         'python-simplejson' 'python-libarchive-c' 'python-debian')
makedepends=('python-setuptools')
optdepends=('lxd')
options=(!emptydirs)
source=("https://github.com/ubuntu-core/snapcraft/archive/${pkgver}.tar.gz")
sha256sums=('61bb5f4d6123540d13a9993ea8fe6d4b2bb37f822b3d6993bd0f92dd03cbec5f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
