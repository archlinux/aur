# Maintainer  : beest <gnubeest@gmail.com>
# Contributor : Anton Shestakov <engored*ya.ru>
# Contributor : Daenyth <Daenyth+Arch _AT_ gmail _DOT_ com>
# Contributor : wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor : sh__

pkgname=uqm-sound
pkgver=0.7.0
pkgrel=1
arch=('any')
pkgdesc='Optional sound package for Ur-Quan Masters (uqm). Includes voices and 3do music.'
url='http://sc2.sf.net/'
license=('GPL')
depends=('uqm>=0.7.0')
source=("http://downloads.sourceforge.net/sourceforge/sc2/uqm-${pkgver}-voice.uqm"
        "http://downloads.sourceforge.net/sourceforge/sc2/uqm-${pkgver}-3domusic.uqm")
md5sums=('b78e0606325810f9f2e9ec786191c01b'
         '86a5e376d9b76888add1d10818f0ab9f')
 
conflicts=('uqm-3domusic' 'uqm-voice')
provides=('uqm-3domusic' 'uqm-voice')

build() {
  /bin/true
}

package() {
  cd $srcdir
  
  install -Dm644 uqm-${pkgver}-voice.uqm \
  $pkgdir/usr/share/uqm/content/addons/uqm-${pkgver}-voice.uqm
  
  install -Dm644 uqm-${pkgver}-3domusic.uqm \
  $pkgdir/usr/share/uqm/content/addons/uqm-${pkgver}-3domusic.uqm
}

