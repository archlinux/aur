# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Schala

# otfinfo --info *.ttf

_pkgname='invader-zim'
pkgname="ttf-${_pkgname%-*}"
pkgver=20010314
pkgrel=1
pkgdesc='The official Invader Zim font direct from Nickelodeon'
arch=('any')
url='https://www.dafont.com/invader-zim.font'
license=('unknown')
provides=("ttf-${_pkgname}")
conflicts=("ttf-${_pkgname}")
source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://dl.dafont.com/dl/?f=${_pkgname/-/_}"
        "${pkgname}-${pkgver}-${pkgrel}-README.png::https://www.dafont.com/img/charmap/${_pkgname::1}/${_pkgname:1:1}/${_pkgname/-/_}0.png")
sha256sums=('3f673a31e4b16bfdee9600096a276b3047b0f5a0cb57cb24a9ed2852ba3983c2'
            'bc7744c042b4c4f869dead513a1b01213be112a13996295b2b0afd0451837c80')

package() {
  install -Dvm644 'INVADER.TTF' -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}-README.png"  "${pkgdir}/usr/share/doc/ttf-${_pkgname}/README.png"
}

# vim: ts=2 sw=2 et:
