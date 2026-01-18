# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='niramit'
_fnamecap="TH-Niramit-AS"
_filename="04-${_fnamecap}.zip"
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
sha256sums=('4bc5f6ef6a736dd572fdb5ec2d0e6e893a2ded8960d57fbd0c2490af13c940b5')
b2sums=('739bc1f213204f554a282f14820d0c9f0b361b7e143898301b688e5867e74ea7402feb1ca5db18045c4d0379cb76339ea613b3e52dfb9fbebbfdd107f9ce4bc8')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
