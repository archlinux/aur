# Maintainer: yair reshef <yair99@gmail.com>
# Contributor: piojo

pkgname=astrill
pkgver=2.9.3
pkgrel=0
pkgdesc="VPN configuration tool for Astrill's servers"
arch=('x86_64' 'i686')
url="http://astrill.com/"
license=('custom')
depends=()
if [ "${CARCH}" = 'x86_64' ]; then
    rpmpkg='astrill-setup-linux64.rpm'
    md5sums=('49373a4cc0ed89f87400e2292078f3e5')
else
    rpmpkg='astrill-setup-linux.rpm'
    md5sums=('ee21d58a2f61985c26d801cdc8b32309')
fi
source=("https://www.astrill.com/downloads/$rpmpkg")

package() {
    mv "${srcdir}/usr" "${pkgdir}"
}
