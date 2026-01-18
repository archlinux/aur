# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_fname='fah'
_fnamecap="TH-Fah-Kwang"
_filename="13-${_fnamecap}.zip"
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
sha256sums=('c84defc4af5e4dd1b8c0c9bd25d23b1962a8998d5b58f5700468eff6eb0d1869')
b2sums=('f78aa54cced9926db79848ed5405d4559b360d4987aa2c1909568ea9f97c2bcadf2863336b58d04d1d880ed1265843e4b5027f124e72d23c36e41e8ba3ff7fa3')

package() {
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/SIPA" *.ttf
}
