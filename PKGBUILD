# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-gtk
pkgver=0.50.6
_pkgver=0.50.6-0~wily1
pkgrel=1
pkgdesc="A Linux clone of Notepad++  This package enables GTK style on startup. The application itself is still compiled against Qt5."
arch=('any')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
options=('!strip')
depends=('bash' "notepadqq-common=${pkgver}" "notepadqq>=${pkgver}" )
conflicts=('notepadqq-git')
sha256sums=('c510e8f8588927f87aa15fa96765748dadfe337331eb96903794d2c1be0e18d4')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-gtk_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
}
