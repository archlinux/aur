# Maintainer: xausky <xausky[at]163[dot]com>
pkgname=hand-network
pkgver=1.1
pkgrel=2
pkgdesc='The application can auto login hand-china company network.'
url='https://github.com/xausky/hand-network'
arch=('x86_64')
license=('MIT')
depends=('python-gobject' 'python-requests' 'python-urllib3')
source=('git+https://github.com/xausky/hand-network')
md5sums=('SKIP')
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

