# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname="ttf-genzengothic-kai"
pkgver=1.501
pkgrel=1
pkgdesc="Japanese gothic font imitating the MV subtitles of 「全てあなたの所為です。」"
url="https://github.com/snowdropQwQ/GenZenGothic-Kai"
license=("OFL-1.1-RFN")
arch=("any")
source=("https://github.com/snowdropQwQ/GenZenGothic-Kai/releases/download/v1.501/GenZenGothic.ttf"
  "https://raw.githubusercontent.com/snowdropQwQ/GenZenGothic-Kai/refs/heads/master/OFL.txt")
noextract=('GenZenGothic.ttf' 'OTF.txt')
sha256sums=("28fc857af4632ee0dfbe0544218c781958a86a0a8a2ca3fac3ca6048c13d38fc"
  "bf3d88b45f0469d7c3668a0a13216c18b4e728d1d4d9ba09deabd0b317d00add")

package() {

  install -Dm644 "${srcdir}/GenZenGothic.ttf" "${pkgdir}/usr/share/fonts/TTF/GenZenGothic.ttf"
  install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
