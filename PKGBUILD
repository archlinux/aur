# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='kodchasan'
_fnamecap="TH-${_fname^}"
_filename="06-TH-Kodchasal.zip"
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
sha256sums=('80c9a0eb44d226334c38c4a200cb069adebd60168fb728cbf295c1847b364ab8')
b2sums=('c183eff2e002c5e51265a64adc876d136df526ed2f08952d3eacadc794957c081bf9972709d82cb958dfd8821e5bcff5e8b70611bb417a2cea9c18f6e40c7335')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
