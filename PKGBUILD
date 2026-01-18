# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='baijam'
_fnamecap="TH-${_fname^}"
_filename="11-${_fnamecap}.zip"
_licename='DIP&SIPA Font License Agreement'
_licepath="${_licename}.txt"
_fontpath="./"

pkgname="ttf-sipa-${_fname}"
groups=("ttf-sipa-fonts")
pkgver=1
pkgrel=1
pkgdesc="Thailand national fonts: TH-Bai-Jamjuree-CP"
arch=(any)
url='https://www.f0nt.com/release/13-free-fonts-from-sipa/'
license=("LicenseRef-DIP_SIPA Font License Agreement")
source=("https://www.f0nt.com/?dl_name=sipafonts/${_filename}")
sha256sums=('f32f37df240f368b89f48050826f6a7a264cb093f06cfe7b278bf235e44673e9')
b2sums=('6500d42457097c6064bf1cb1e11f67a3d966237e79978f53eff9ce866452e00b5dc40b7553aacf971a2d4c8dfd9f36fccef601d7ad707541ce674fb31e9d772b')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
