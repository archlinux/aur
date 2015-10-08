# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-gtk
pkgver=0.50.4
_pkgver=0.50.4-0~vivid1
pkgrel=1
pkgdesc="A Linux clone of Notepad++  This package enables GTK style on startup. The application itself is still compiled against Qt5."
arch=('any')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
options=('!strip')
depends=('bash' "notepadqq-common=${pkgver}" "notepadqq>=${pkgver}" )
conflicts=('notepadqq-git')
sha256sums=('aedabbc20d0bab5e00aa5df2aa604f50143322317d34a798c15a5f3b22009d44')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-gtk_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
}
