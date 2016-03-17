# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-gtk
pkgver=0.51.0
_pkgver=0.51.0-0~wily1
pkgrel=1
pkgdesc="A Linux clone of Notepad++  This package enables GTK style on startup. The application itself is still compiled against Qt5."
arch=('any')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
options=('!strip')
depends=('bash' "notepadqq-common=${pkgver}" "notepadqq>=${pkgver}" )
conflicts=('notepadqq-git')
sha256sums=('3a91f2bb97ff119f3a7e83a4c4df5048c402ad544702b1f7b7cd5d3d3501453f')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-gtk_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
}
