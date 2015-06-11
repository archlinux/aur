# Maintainer: Benjamin Robin <benjarobin>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=network-wait-online
pkgver=1.0
pkgrel=3
pkgdesc="Network wait connection ready"
arch=('any')
url="http://forums.archlinux.fr/topic12900.html"
license=('GPL')
depends=('iputils' 'iproute2' 'systemd')
install='network-wait-online.install'
source=('network-wait-online.sh'
        'network-wait-online@.service')

md5sums=('474bb67b387f65129a5dd28f15949ab9'
         '6dcbded3675e36174921c2d6d162e837')

package()
{
    install -Dm755 "${srcdir}/network-wait-online.sh" "${pkgdir}/usr/bin/network-wait-online"
    install -Dm644 "${srcdir}/network-wait-online@.service" "${pkgdir}/usr/lib/systemd/system/network-wait-online@.service"
}
