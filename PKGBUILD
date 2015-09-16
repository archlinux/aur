# Maintainer: Trevor <assviolat0r at live dot com>
pkgname=skype-desktop-bin
pkgver=c153b15
pkgrel=1
pkgdesc="An unofficial client of Skype for Linux, running on top of Node Webkit."
arch=('i686' 'x86_64')
url="https://github.com/haskellcamargo/skype-unofficial-client"
license=('MIT')
depends=()
makedepends=('make')
#options=('!strip')
#[ "$CARCH" = "i686" ]   && _platform=linux_32
#[ "$CARCH" = "x86_64" ] && _platform=linux_64
source=(git+https://github.com/haskellcamargo/skype-unofficial-client.git)
md5sums=('SKIP')
_gitname=skype-unofficial-client

pkgver () {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
	cd $_gitname
        sudo make
}

