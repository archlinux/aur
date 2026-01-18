# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='mali'
_fnamecap="TH-Mali-Grade-6"
_filename="09-${_fnamecap}.zip"
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
sha256sums=('decb8aa3c2406f1ebceeed5f5e4a21fb2ba4333bdc95263a54576a69b98d7ca9')
b2sums=('d3e6875584af57cc7899db38af16572378b9d3751a73bc5fa8c3da7fcbb55cbad36a16820e47c3746c734a941213d476959434b4b0ee8b33265253d7d45f5b47')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
