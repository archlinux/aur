# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rally-symbols'
pkgname="otf-${_pkgname}"
pkgver=1.001
pkgrel=1
pkgdesc='Automotive rally symbols font'
arch=('any')
url='https://www.dafont.com/rally-symbols.font'
license=('custom')
source=("${pkgname}-${pkgver}.zip::https://dl.dafont.com/dl/?f=${_pkgname/-/_}"
        "${pkgname}-${pkgver}-README.png::https://www.dafont.com/img/charmap/${_pkgname::1}/${_pkgname:1:1}/${_pkgname/-/_}0.png"
        'LICENSE')
sha256sums=('e78fcca993f27119a30261e918f3ae2e048acddca76b7e89d6e65cba910dc06d'
            'e7965f9fd44fbbd667c461dc1a5cf0a463e0cce9eee1a10dba6b1b277e2a400b'
            '78a4c94338e4a1d515d1673b07f236ddbda7afb1cef13eb1ce020499648ab340')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" ./*.otf
  install -Dm644 "${pkgname}-${pkgver}-README.png"  "${pkgdir}/usr/share/doc/${pkgname}/README.png"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim:set ts=2 sw=2 et:
