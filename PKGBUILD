# Maintainer: Rodolphe Fouquet <vachicorne at pm dot me>
pkgname=zoom-vmware-plugin
pkgver=5.17.5
_subver=24630
pkgrel=1
pkgdesc="Zoom VDI VMWare plugin "
arch=('x86_64')
license=('custom')
url="https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
depends=(
  'vmware-horizon-client'
  'vmware-horizon-rtav'
)
optdepends=()
replaces=()

source=("https://zoom.us/download/vdi/${pkgver}.${_subver}/zoomvdi-universal-plugin-centos_${pkgver}.rpm")

sha512sums=('b43926739d1de5b487718ee3975e3dd915ce6aaefedce0969f5680eb8e792182a8613adb71e670d867cc43818ede50603f20bcd759ee130c22644d4edbc56f0a')

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}


