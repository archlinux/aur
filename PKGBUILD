# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.14.10
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

sha512sums=('966b095cedefe84b17bc911fbc07f4790f81515da3ba2b9e530de5f9ee2a33c9c534ba65338bf589c7898e0af8d1b3570a4a62b6626079887644067a367eb681')

install=$pkgname.install

package() {

  #Setup
  cd $pkgdir
  mv $srcdir/etc .
  mv $srcdir/usr .

  #Set systemd service file perms
}
