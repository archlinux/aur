# Maintainer: morguldir <morguldir@protonmail.com
# Contributor: Pasquale Boemio <boemianrapsodi@gmail.com>

pkgname=python-portio
pkgver=0.5
pkgrel=1
pkgdesc="Python low level port I/O for Linux x86"
arch=('x86_64')
url="http://portio.inrim.it/"
license=('GPL')
depends=('python')
source=(http://portio.inrim.it/portio-$pkgver.tar.gz)
sha256sums=('fb195bcc078488d97d5f55228ec4b21c077ff2c178fd0447b6203d041fb98954')

package()
{
    cd ${srcdir}/portio-$pkgver
    python setup.py install --root="$pkgdir" 
}
