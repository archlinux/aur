# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.7.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc='Wazuh Dashboard for Arch Linux'
arch=('x86_64')
url='https://wazuh.com/'
license=('gpl2')
depends=(
    'libcap'
);
optdepends=(
);
validpgpkeys=('9E646BB0630C8FD18ACD15541B93E6A766CD229D')

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
  'wazuh-dashboard-4.7.2-1.x86_64.rpm.sig'
)

backup=(
  'etc/wazuh-dashboard/certs'
  'usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml'
  )

sha512sums=('0f3ae9840be332b86dfc1972c39cb6e3600fedf1ae5f95623f0692d2f4e5269f27e319699596461dca85c7704ee5fb38982ceca7e7572aa29279a34d390ad20b'
            'SKIP')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
