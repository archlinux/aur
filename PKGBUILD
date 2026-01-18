# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='sarabun'
_fnamecap="TH-Sarabun-PSK"
_filename="07-${_fnamecap}.zip"
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
sha256sums=('fd7b1596364ab8ae11f50e8abb71eb1189b0aa6275e71c8e25b0187578a26cae')
b2sums=('a73fb001a0414601609813ffb8dee6dbffe0606e3f0e3290f3e3dba1d48cbf029bc50a5066bb4ede609d169411cf441496db63c7760f6e2f2565aea1d33b3c04')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
