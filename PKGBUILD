# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='koho'
_fnamecap="TH-KoHo"
_filename="12-${_fnamecap}.zip"
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
sha256sums=('ae99bfbbfb1c9f2886e54a6c27816e8a7246c795bfc8e3713b984fccb39a49e8')
b2sums=('34316670280871de9870d5711a1eff1aad58fd477c40a9c426a06b52625ebde3bab557958910398050a2539351bc806d89fa94dab9c593477269e2d9951ad269')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
