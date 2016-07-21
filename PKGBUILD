# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=transwhat
pkgver=0.2
pkgrel=2
epoch=1
pkgdesc="A gateway between the XMPP and the WhatsApp IM networks"
arch=('any')
url="https://github.com/stv0g/transwhat"
license=('GPL')
provides=('transwhat')
depends=('python' 'protobuf-python' 'python-pillow' 'python-dateutil' 'python-yowsup-git>=2' 'python-e4u')
makedepends=('python-setuptools')
options=('!strip' '!emptydirs')

source=("git+http://github.com/stv0g/transwhat.git#branch=setuptools")
sha512sums=(SKIP)

package() {
  cd "${srcdir}/${pkgname}"
  
  python setup.py install --root="$pkgdir/"
}
