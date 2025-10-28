# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.14.0
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

sha512sums=('465b62dfcf301586ddc416a3eca8e0078e78450aa36668f6d088769ef08fee5a307d29f16a944ff63880ad1544513c5887438dc9f772c38f9a3ffbd001a7d061')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
