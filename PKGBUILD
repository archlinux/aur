# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='k2d'
_fnamecap="TH-K2D-July8"
_filename="08-${_fnamecap}.zip"
_licename='DIP&SIPA Font License Agreement'
_licepath="${_licename}.txt"
_fontpath="./"

pkgname="ttf-sipa-${_fname}"
groups=("ttf-sipa-fonts")
pkgver=1
pkgrel=1
pkgdesc="Thailand national fonts: ${_fnamecap}"
arch=(any)
url='https://www.f0nt.com/release/13-free-fonts-from-sipa/'
license=("LicenseRef-DIP_SIPA Font License Agreement")
source=("https://www.f0nt.com/?dl_name=sipafonts/${_filename}")
sha256sums=('48250962168ae4e42738518b968f8075e326a7d10ec40d67c5cfbeeac6a2e37a')
b2sums=('7be940413df2d6cdb56878a323b973023276ff9c6e1fa3895ade0f55f9b5cc631e3b58debdfac2e2fbd2f87b3e86b79e89ecf86a8d144c0cada41a8016c7d6fd')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
