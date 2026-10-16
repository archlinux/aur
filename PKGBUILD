# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.14.9
pkgrel=1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgdesc='Wazuh Dashboard for Arch Linux'
arch=('x86_64')
url='https://wazuh.com/'
license=('gpl2')
groups=("wazuh-siem")
depends=(
  'libcap'
)
optdepends=(
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

sha512sums=('1ddb6e286010f42398f1401e11b1b9d68b13944db6e263151d5ab1697c1b3048624da7cb89c26954b49bbc2678f8ce03c39007f5483758133f0262eb7a68901d')

install=$pkgname.install

package() {

  #Setup
  cd $pkgdir
  mv $srcdir/etc .
  mv $srcdir/usr .

  #Set systemd service file perms
}
