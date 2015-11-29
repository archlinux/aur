# Maintainer: modinfo <skorotkiewicz@gmail.com>

pkgname=timegen
pkgver=0.4
_pkgver=0.4
_pkgverbase=${pkgver%%.*}
pkgrel=1
pkgdesc="Manipulate a radio controlled clock via speaker"
arch=(i686 x86_64)
url="http://bastianborn.de/radio-clock-hack"
license=('GPL' 'MPL' 'LGPL')

makedepends=('gcc' 'unzip')
source=(http://bastianborn.de/static/dl/timegen-0.4-src.zip)

sha256sums=('387bf28ee4ad24970686e4224928316c705281ef639a880f391303e56ef0496a')

prepare() {

  unzip timegen-0.4-src.zip

}

build() {

  make

}

package () {

  sudo mv $srcdir/timegen /usr/bin/

}


