# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.9.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc='Wazuh Dashboard for Arch Linux'
arch=('x86_64')
url='https://wazuh.com/'
license=('gpl2')
groups=("wazuh-siem")
depends=(
    'libcap'
);
optdepends=(
);

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

backup=(
  'etc/wazuh-dashboard/certs'
  'etc/wazuh-dashboard/opensearch_dashboards.yml'
  'usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml'
  )

sha512sums=('980ff201fb24c13024605c6fb7e8f7fb64a20ec0bca496369b6b9934d6a6a976d26d83cb2e91e32f85d887de8209b876d493ce623a61ae9d936306062ef04e08')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
