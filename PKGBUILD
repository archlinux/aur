# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: <predrg@gmail.com>

pkgname=alsamixer.app
_appname=AlsaMixer.app
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Simple dockable mixer application for Linux with ALSA drivers."
arch=('i686' 'x86_64')
url="http://www.dockapps.net/alsamixerapp"
license=('GPL')
depends=('alsa-lib' 'libxpm')
source=("http://www.dockapps.net/download/${_appname}-${pkgver}.tar.gz")
md5sums=('df3548182e10370f75c1c978e4a1b64d')

build() {
  cd ${_appname}-${pkgver}
  make
}

package() {
  cd ${_appname}-${pkgver}
  install -D -m755 $_appname "$pkgdir"/usr/bin/$_appname
}
