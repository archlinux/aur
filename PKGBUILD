# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-ipki
pkgver=1.4.10.542
pkgrel=1
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install
options=('!strip')

ARCH='amd64'
md5sums=('8ba2c1136d1b5cf005abf72e378d635a')

_file_name=$pkgname'_'$pkgver'-1_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/linux/DEBS/pool/non-free/b/bit4id-ipki/'$_file_name)

package() {
	ar -xv $_file_name || return 1
	tar -xvf data.tar.[xg]z -C $pkgdir || return 1
}
