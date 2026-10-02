# Maintainer: yuna0x0 <yuna@yuna0x0.com>

_fname=line-seed-tw
pkgbase="${_fname}-font"
pkgname=("otf-${_fname}" "ttf-${_fname}")
pkgver=1.400
pkgrel=1
pkgdesc='LINE Seed TW font'
arch=(any)
url='https://seed.line.me'
license=('OFL-1.1-RFN')
source=('https://seed.line.me/src/images/fonts/LINE_Seed_TW.zip')
sha256sums=('a1992cd9e372f94a3cef52b98cee781639fe8b7f4d1a77e318a133acf857aecd')
b2sums=('5024bbbe873797da2c9ece192782e1fffcfe9ed73b2e27039eb7cb3b6f9cf59584673bef2eec8782f91aedf6d7e2718c6d2a32cf69b351747996b4ecf4bac1db')

package_otf-line-seed-tw() {
  pkgdesc+=' (OTF)'
  cd "$(find -maxdepth 1 -mindepth 1 -type d -name 'LINE Seed TW*' -print)"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.txt
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" OTF/*.otf
}

package_ttf-line-seed-tw() {
  pkgdesc+=' (TTF)'
  cd "$(find -maxdepth 1 -mindepth 1 -type d -name 'LINE Seed TW*' -print)"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.txt
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" TTF/*.ttf
}
