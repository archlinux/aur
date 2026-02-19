# Maintainer  : kabino11 <kabino11 at gmail dot com>
# Contributor : beest <gnubeest at zoho dot com>
# Contributor : Anton Shestakov <engored*ya.ru>
# Contributor : Daenyth <Daenyth+Arch _AT_ gmail _DOT_ com>
# Contributor : wizzomafizzo <wizzomafizzo at gmail dot com>
# Contributor : sh__

pkgname=uqm-sound
pkgver=0.8.0
pkgrel=1
arch=('any')
pkgdesc='Optional sound package for Ur-Quan Masters (uqm). Includes voices and 3do music.'
url='http://sc2.sf.net/'
license=('GPL')
depends=('uqm>=0.8.0')
source=("http://downloads.sourceforge.net/sourceforge/sc2/uqm-${pkgver}-voice.uqm"
        "http://downloads.sourceforge.net/sourceforge/sc2/uqm-${pkgver}-3domusic.uqm")
md5sums=('fc89f77d7b66c2669abca6c157f5259a'
         '9e5801d45ca12028b486cdeb83568c02')
 
package() {
    cd "$srcdir"
  
    install -Dm644 "uqm-${pkgver}-voice.uqm" \
    "$pkgdir/usr/share/uqm/content/addons/uqm-${pkgver}-voice.uqm"
  
    install -Dm644 "uqm-${pkgver}-3domusic.uqm" \
    "$pkgdir/usr/share/uqm/content/addons/uqm-${pkgver}-3domusic.uqm"
}
