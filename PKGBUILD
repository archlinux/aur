# Maintainer:  Alex Petrovsky <met4inf@gmail.com>

pkgname=ttf-fairfax-hd
pkgdesc='Fairfax HD is a halfwidth scalable monospace font for terminals, text editors, IDEs, etc.'
pkgver=1.001
pkgrel=1
arch=('any')
license=('custom:SIL Open Font License v1.1')
_commit='cbaca8d9d6d65bddbc05dd3e20b7063639f6664a'
url='https://www.kreativekorp.com/software/fonts/fairfaxhd/'
source=("FairfaxHD-${pkgver}.ttf::https://github.com/kreativekorp/open-relay/raw/${_commit}/FairfaxHD/FairfaxHD.ttf"
        "FairfaxSMHD-${pkgver}.ttf::https://github.com/kreativekorp/open-relay/raw/${_commit}/FairfaxHD/FairfaxSMHD.ttf"
        "FairfaxHaxHD-${pkgver}.ttf::https://github.com/kreativekorp/open-relay/raw/${_commit}/FairfaxHD/FairfaxHaxHD.ttf"
        "FairfaxPonaHD-${pkgver}.ttf::https://github.com/kreativekorp/open-relay/raw/${_commit}/FairfaxHD/FairfaxPonaHD.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/kreativekorp/open-relay/raw/${_commit}/FairfaxHD/OFL.txt")
sha256sums=('c3b521f9667001ae2b5a4491986bd1716fcd4955699fbb0300a2f01e53ca6951'
            '6d554128cb92eece0303ade4b362e340957f12e8ad8da28e4ad150a1dbfd92c6'
            'bb61bc0f2e035ab4f9287b41a443ad646f6af569c5f5444f69cd9d1e0c8059ab'
            '62e430e429a011f31d858489814f531153080b9e63f18705262d523be8c1e3ba'
            'f41c62b00b213a055f606b635451ee8aeb3f793a5d3846cc22ceee19a7dbb6db')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 FairfaxHD-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/FairfaxHD.ttf"
  install -m 644 FairfaxSMHD-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/FairfaxSMHD.ttf"
  install -m 644 FairfaxHaxHD-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/FairfaxHaxHD.ttf"
  install -m 644 FairfaxPonaHD-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/FairfaxPonaHD.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
