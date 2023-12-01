# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.7.0
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

sha256sums=('edf6222e6a53ad80b5b12cd41d6e86454e18616c9e8ea5bd3bc0751a4196747d')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
