# Maintainer: yair reshef <yair99@gmail.com>
# Contributor: piojo, jediofthecode

pkgname=astrill
pkgver=3.2.0
pkgrel=0
pkgdesc="VPN configuration tool for Astrill's servers"
arch=('x86_64' 'i686')
url="http://astrill.com/"
license=('custom')
depends=()
if [ "${CARCH}" = 'x86_64' ]; then
    rpmpkg='astrill-setup-linux64-3.2.rpm'
    md5sums=('9cccb28cfeb5aa5d7de0034941071e14')
else
    rpmpkg='astrill-setup-linux-3.2.rpm'
    md5sums=('ad33977e9dd490b7adf25bec262e52bb')
fi
source=("https://www.astrill.com/downloads/$rpmpkg")

package() {
    mv "${srcdir}/usr" "${pkgdir}"
}
