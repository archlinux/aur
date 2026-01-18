# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='chakra'
_fnamecap="TH-Chakra-Petch"
_filename="10-${_fnamecap}.zip"
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
sha256sums=('7507b3b81ae36460057e325fa7b4a467a0003bb855b57ec84a8ac5efe71cc9c5')
b2sums=('4a3e517954af1ac740170f57e0a2b7ff2820b7265b084febed03f8dc626070f7e5885a02dd972cf59ef9f4581d188b6bd77fd788620025c4490c4c428817f290')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
