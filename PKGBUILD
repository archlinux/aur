# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='srisakdi'
_fnamecap="TH-${_fname^}"
_filename="03-${_fnamecap}.zip"
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
sha256sums=('3ae07e27d0f4eba6d04664f234dc257e0b842d901bd38aba9ea815c2f88d18db')
b2sums=('631ba04b9de3e40759a72961e86dca08314d5122acdbcbaaa42923074470dde35a3fc1b4b53c14dbbce7507170023199431e54edd7d32ee58867317c4248bd05')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
