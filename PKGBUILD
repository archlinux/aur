# Maintainer:  twa022 <twa022 at gmail dot com>

_pkg=1
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
sha256sums=('605aafb84a4669cc6d64dec2d93b3585dc260971bcc5db7d63478f8f8901c7b4')

package() {
  install -Dm644 ${_folder[${_pkg}]}/sounds/* -t "${pkgdir}"/usr/share/anoise/sounds/
}
