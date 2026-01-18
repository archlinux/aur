# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='krub'
_fnamecap="TH-${_fname^}"
_filename="02-${_fnamecap}.zip"
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
sha256sums=('c13417e852a9ca65c1e8f6c14bc3335d13ed8233618f72f51f49c4a6d539eedf')
b2sums=('8981bd4a15de068c95608c2b4c473903ddaf530149eb93a26efd90b0eea1016fe818a356ee12308033813ee1d3d99321d73e20552f339340fd4e77b1928e5ebc')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
