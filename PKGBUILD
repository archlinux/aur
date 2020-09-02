# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: 

_pkgname='invader-zim'
pkgname="ttf-${_pkgname%-*}"
pkgver=20010314
pkgrel=1
pkgdesc='The official Invader Zim font direct from Nickelodeon'
arch=('any')
url='https://www.dafont.com/rally-symbols.font'
license=('unknown')
provides=("ttf-${_pkgname}")
source=("${pkgname}-${pkgver}.zip::https://dl.dafont.com/dl/?f=${_pkgname/-/_}"
        "${pkgname}-${pkgver}-README.png::https://www.dafont.com/img/charmap/${_pkgname::1}/${_pkgname:1:1}/${_pkgname/-/_}0.png")
sha256sums=('3f673a31e4b16bfdee9600096a276b3047b0f5a0cb57cb24a9ed2852ba3983c2'
            'bc7744c042b4c4f869dead513a1b01213be112a13996295b2b0afd0451837c80')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" 'INVADER.TTF'
  install -Dm644 "${pkgname}-${pkgver}-README.png"  "${pkgdir}/usr/share/doc/ttf-${_pkgname}/README.png"
}

# vim:set ts=2 sw=2 et:
