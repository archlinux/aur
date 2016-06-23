# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=2.10.1
pkgrel=2
pkgdesc="Build Ubuntu snappy packages."
arch=('any')
url="http://snapcraft.io"
license=('GPL')
depends=('python-apt' 'python-requests-oauthlib' 'python-ssoclient' 'python-progressbar'
         'python-requests-toolbelt' 'python-petname' 'python-jsonschema' 'python-yaml'
         'python-magic' 'python-docopt')
makedepends=('python-setuptools')
optdepends=('lxd')
options=(!emptydirs)
source=("https://github.com/ubuntu-core/snapcraft/archive/${pkgver}.tar.gz")
sha256sums=('3b1ba75b3e671eba3afeeab9895d6c7e9a0390cf0fb2f0c32058636b68dee0a5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
