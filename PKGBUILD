# Maintainer:  twa022 <twa022 at gmail dot com>

_pkg=5
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
sha256sums=('3d47b51b7ad05913bfe20e016e698396d7964d957cedcc48482639441b98974b')

package() {
  install -Dm644 ${_folder[${_pkg}]}/sounds/* -t "${pkgdir}"/usr/share/anoise/sounds/
}
