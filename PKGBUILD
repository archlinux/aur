# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.4.3
pkgrel=2
pkgdesc="Program to update personal user details"
arch=('any')
url="https://github.com/bluesabre/mugshot"
license=('GPLv3')
depends=('gtk3' 'python-pexpect' 'python-cairo' 'python-gobject' 'accountsservice')
makedepends=('python-distutils-extra' 'intltool')
optdepends=('cheese: webcam support'
            'pidgin: update buddy icon'
            'libreoffice: update user details')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('afab48b119091b70d66689931fe1bec95c761a9da16d3ad070f37c6fb54286f8')

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
