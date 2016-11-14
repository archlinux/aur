# Maintainer: András Wacha <awacha aT gMaIl>
pkgname=monitoring-plugins-afs
pkgver=2.4
pkgrel=1
pkgdesc="Monitoring plugins for Nagios, Icinga etc. for OpenAFS servers"
arch=('any')
url="https://www.eyrie.org/~eagle/software/afs-monitor/"
license=('GPL' 'Perl-Artistic')
depends=()
makedepends=()
checkdepends=()
source=("http://archives.eyrie.org/software/afs/afs-monitor-2.4.tar.gz"
        "http://archives.eyrie.org/software/afs/afs-monitor-2.4.tar.gz.asc")
md5sums=('54ade3bf2bad0e4db814c4103f9e72be'
         'SKIP')

#validpgpkeys=('7D80315C5736DE75')

package() {
    echo $(pwd)
    mkdir -p ${pkgdir}/usr/lib/monitoring-plugins/
    cp afs-monitor-$pkgver/check_afs_bos ${pkgdir}/usr/lib/monitoring-plugins/
    cp afs-monitor-$pkgver/check_afs_quotas ${pkgdir}/usr/lib/monitoring-plugins/
    cp afs-monitor-$pkgver/check_afs_rxdebug ${pkgdir}/usr/lib/monitoring-plugins/
    cp afs-monitor-$pkgver/check_afs_space ${pkgdir}/usr/lib/monitoring-plugins/
    cp afs-monitor-$pkgver/check_afs_udebug ${pkgdir}/usr/lib/monitoring-plugins/
    mkdir -p ${pkgdir}/usr/share/monitoring-plugins-afs/
    cp "afs-monitor-$pkgver/NEWS"  ${pkgdir}/usr/lib/monitoring-plugins/
    cp "afs-monitor-$pkgver/README"  ${pkgdir}/usr/lib/monitoring-plugins/
    cp "afs-monitor-$pkgver/TODO"  ${pkgdir}/usr/lib/monitoring-plugins/
}
