# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='charmonman'
_fnamecap="TH-${_fname^}"
_filename="01-${_fnamecap}.zip"
_licename='ProfDrSrisakdi Font License Agreement'
_licepath="${_licename}.txt"
_fontpath="./"

pkgname="ttf-sipa-${_fname}"
groups=("ttf-sipa-fonts")
pkgver=1
pkgrel=1
pkgdesc="Thailand national fonts: ${_fnamecap}"
arch=(any)
url='https://www.f0nt.com/release/13-free-fonts-from-sipa/'
license=("LicenseRef-${_licename}")
source=("https://www.f0nt.com/?dl_name=sipafonts/${_filename}")
sha256sums=('c72053c7cdcd7252b84ca031b3f05086e18a8a192cab5014603f221639c9dd09')
b2sums=('06b9f95dc8aa951b919f9b4a97f74263d75db5c19f944eeb69b2e658df093e8a288f20350b019910786d2938b1707d5a469b11275d59b91ad846647862ffd178')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
