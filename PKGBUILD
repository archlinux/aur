# Maintainer: Victor Rouquette <victor@rouquette.me>

pkgname=ttf-noir-et-blanc
pkgver=1.0
pkgrel=1
pkgdesc='Font Blanc et Noir by Paul Lloyd'
arch=('any')
url='https://moorstation.org/typoasis/designers/lloyd/'
license=('custom:100% Free')
source=("noir_et_blanc.zip::https://dl.dafont.com/dl/?f=noir_et_blanc")
md5sums=('7e424605bf1a76b4701e808159ae6b78')
sha256sums=('ed4635c83b8696f12173a67390636223144c20cc7673458cf562fcd0cbfe1144')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 N_E_B.TTF "${pkgdir}/usr/share/fonts/TTF/Noir-et-Blanc.ttf"
  install -m 644 N_E_B_B.TTF "${pkgdir}/usr/share/fonts/TTF/Noir-et-Blanc-Bold.ttf"
  install -Dm644 README "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
