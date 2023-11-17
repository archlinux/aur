# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contribuidor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.6.0
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Dashboard for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
    'libcap'
);
optdepends=(
);
validpgpkeys=('9E646BB0630C8FD18ACD15541B93E6A766CD229D')

source=("https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('c9849ed2c021d53fbafae8dffe0918605f94ff10ffff5c2881ae6bda74c193e2')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
