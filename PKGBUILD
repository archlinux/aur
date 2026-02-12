# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.14.3
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

sha512sums=('8c1e8d6d7ceaf62c86005655d14686a1a5b88aa159dd90a28d60837242067f9b5c4ee7cc9f15c7747361581d8b411753c20c89f9a1888fffffb68561d435e0a0')

install=$pkgname.install

package() {

  #Setup
  cd $pkgdir
  mv $srcdir/etc .
  mv $srcdir/usr .

  #Set systemd service file perms
}
