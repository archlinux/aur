# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
<<<<<<< HEAD
pkgver=4.14.0
=======
pkgver=4.12.0
>>>>>>> 0046c7680f1c9c0a8c6d7b6876f5dab9ed1b8574
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

<<<<<<< HEAD
sha512sums=('465b62dfcf301586ddc416a3eca8e0078e78450aa36668f6d088769ef08fee5a307d29f16a944ff63880ad1544513c5887438dc9f772c38f9a3ffbd001a7d061')
=======
backup=(
  'etc/wazuh-dashboard/certs'
  'etc/wazuh-dashboard/opensearch_dashboards.yml'
  'usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml'
  )

sha512sums=('9dbb093928f5e5553489c929c3f0cfe8fca56151834f433e18aa35008c5ad1afc3ab78d041c7184790170e8327d285c9169db0815f08c92eeff88de447e8e75a')
>>>>>>> 0046c7680f1c9c0a8c6d7b6876f5dab9ed1b8574

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
