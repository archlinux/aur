# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: Zom <zom[at]eevul[dot]org>

pkgname=notepadqq-bin
pkgver=0.46.0
_pkgver=0.46.0-0~utopic1
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

md5sums_i686=('22510e23dfc296f8fd18132145c00a1d')
md5sums_x86_64=('60d53acd548c32fc7a71144ae523e100')
source_i686=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_i386.deb")
source_x86_64=("http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_amd64.deb")

package() {
  cd "${srcdir}"
  
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  
}
