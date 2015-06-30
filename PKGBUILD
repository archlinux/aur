# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-gtk
pkgver=0.50.1
_pkgver=0.50.1-0~vivid1
pkgrel=1
pkgdesc="A Linux clone of Notepad++  This package enables GTK style on startup. The application itself is still compiled against Qt5."
arch=('any')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
options=('!strip')
depends=('bash' "notepadqq-common=${pkgver}" "notepadqq>=${pkgver}" )
conflicts=('notepadqq-git')
sha256sums=('350b4edcf6e2e039756d79201885a409c97060aa43dc1a05db0edd0c3ae460f2')

source=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-gtk_${_pkgver}_all.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
}
