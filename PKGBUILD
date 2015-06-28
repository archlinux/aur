# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: Zom <zom[at]eevul[dot]org>

pkgname=notepadqq-bin
pkgver=0.50.1
_pkgver=0.50.1-0~vivid1
pkgrel=1
pkgdesc="A Linux clone of Notepad++"
arch=('i686' 'x86_64')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
depends=('qt5-webkit' 'desktop-file-utils')
depends_x86_64+=('gcc-libs-multilib')
optdepends=('notepadqq-common: Common UI libs'
            'notepadqq-gtk: enables GTK style on startup')
makedepends=('pacman>=4.2.0')
options=('!strip')
provides=("notepadqq=${pkgver}")
conflicts=('notepadqq-git' 'notepadqq')
install=${pkgname}.install

md5sums_i686=('1b1b2efe79c7d3e0789d12e2b87aa21f')
md5sums_x86_64=('16a04cece23b9dd49746d62189daa97c')
source_i686=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_i386.deb")
source_x86_64=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_amd64.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  
}
