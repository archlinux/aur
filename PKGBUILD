# Maintainer:  twa022 <twa022 at gmail dot com>

_pkg=4
_pkgver=('0' '0.0.1' '0.0.4' '0.0.1' '0.0.1' '0.0.1')
_pkgrel=(0 6 4 6 3 3)
_folder=(''
         'community'
         'community-extension2'
         'media3'
         'community-extension4'
         'community-extension5')
         
pkgname=anoise-community-extension${_pkg}
pkgver=${_pkgver[${_pkg}]}
pkgrel=${_pkgrel[${_pkg}]}
pkgdesc="Ambient Noise Community Library Package ${_pkg}"
arch=('any')
license=('GPL3')
url='https://code.launchpad.net/anoise'
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~costales/+archive/ubuntu/anoise/+sourcefiles/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('4705dfba1ebe16aee5a8f72f0841585069e0dd2fbb12f589c6231c2be655cece')

package() {
  install -Dm644 ${_folder[${_pkg}]}/sounds/* -t "${pkgdir}"/usr/share/anoise/sounds/
}
