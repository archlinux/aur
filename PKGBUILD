# Maintainer: realitygaps <realitygaps AT yahoo DOT com>
pkgname=echoplay
pkgver=0.1
pkgrel=1
pkgdesc="Uses the echonest api to play and download music and videos"
arch=(any)
license=(BSD)
depends=('python' 'pyechonest' 'youtube-dl')
options=(!emptydirs)
url=(http://freeactive.net/echoplay)
source=(echoplay)
md5sums=(c6ff8ae144cd673673a8191b944e3172)
install=

build() {
  mkdir -p $pkgdir/usr/bin  
  cp echoplay $pkgdir/usr/bin/
}

