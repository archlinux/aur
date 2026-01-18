# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='charm'
_fnamecap="TH-Charm-of-AU"
_filename="05-${_fnamecap}.zip"
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
sha256sums=('b2e97fa8fa100b085c2b29af9d4fba3f2076aafbe6f86d080a670b0c2ffe0d97')
b2sums=('e82beb65bed1b28db0e2e7baced6b9391a432a8e6e90b59d3fd8d7befa09e0760e753a25b47b13bc0ac0218ded023424d7b6c81969ba7e8d2f7b8cb02f7304ea')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
