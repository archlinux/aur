# Maintainer: yair reshef <yair99@gmail.com>
# Contributor: piojo, jediofthecode, megahertz

pkgname=astrill
pkgver=3.8.0.2156
pkgrel=0
pkgdesc="VPN configuration tool for Astrill's servers"
arch=('x86_64' 'i686')
url="http://astrill.com/"
license=('custom')
depends=()
if [ "${CARCH}" = 'x86_64' ]; then
    rpmpkg='desktop-linux64-3.8.0.2156.rpm'
    md5sums=('3681872f9e6007e24f914a384e483a55')
else
    rpmpkg='desktop-linux-3.8.0.2156.rpm'
    md5sums=('7418880b51db0fe6781e6a4f17b93f76')
fi
source=("https://www.astrill.com/public/arch/$rpmpkg")

package() {
    mv "${srcdir}/usr" "${pkgdir}"
}
