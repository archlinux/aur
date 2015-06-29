# Maintainer: disarmer mk <disarmer.mk@gmail.com>

_name=smbclient-stub
pkgname=$_name
pkgver=0.01
pkgrel=1
pkgdesc="Stub .so for smbclient painless removal"
arch=('i686' 'x86_64')
license=('gpl')
depends=('coreutils')
replaces=('smbclient')
conflicts=($replaces)
provides=($replaces)
source=()
md5sums=()

package() {
    mkdir "${pkgdir}"/usr/lib/ -p
    ln -s /usr/lib/coreutils/libstdbuf.so "${pkgdir}"/usr/lib/libsmbclient.so.0
}
