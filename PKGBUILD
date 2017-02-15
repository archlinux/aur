# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-gtk
pkgver=1.0.1
_pkgver=1.0.1-0~yakkety1
pkgrel=1
pkgdesc="A Linux clone of Notepad++  This package enables GTK style on startup. The application itself is still compiled against Qt5."
arch=('any')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
options=('!strip')
depends=('bash' "notepadqq-common=${pkgver}" "notepadqq>=${pkgver}" )
conflicts=('notepadqq-git')
sha256sums=('34b70256f96fdab3bb503d27eafe5c8f056820031b48ee7fff4ddd6e9597f495')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-gtk_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
}
