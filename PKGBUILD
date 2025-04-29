# Maintainer: Cyberczy <czysheep@gmail.com>

pkgbase="maplemono"
pkgname=(
  "maplemono-cn-unhinted"
  "maplemono-cn"
  "maplemono-nf-cn-unhinted"
  "maplemono-nf-cn"
  "maplemono-nf-unhinted"
  "maplemono-nf"
  "maplemono-otf"
  "maplemono-ttf-autohint"
  "maplemono-ttf"
  "maplemono-variable"
  "maplemono-woff2"
)
pkgver="7.2"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
makedepends=("unzip")
source=(
  "MapleMono-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-CN-unhinted.zip"
  "MapleMono-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-CN.zip"
  "MapleMono-NF-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN-unhinted.zip"
  "MapleMono-NF-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN.zip"
  "MapleMono-NF-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-unhinted.zip"
  "MapleMono-NF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
  "MapleMono-OTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-OTF.zip"
  "MapleMono-TTF-AutoHint.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-TTF-AutoHint.zip"
  "MapleMono-TTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-TTF.zip"
  "MapleMono-Variable.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-Variable.zip"
  "MapleMono-Woff2.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-Woff2.zip"
)
sha256sums=('f8e0699316e80efbe33f9461f31a05507efa6b6dfb9e2946d0aa3531efd8830e'
            '3d59ad24b57db72a2368ce4221b43d33680e40f871e138ef6a6e2f54ed7f52a3'
            'a93efb7947aaf547a9b75009bb3e0abdb2657eabd4b68a0949e915a09529843d'
            'c3b8f5508f0e13809b373798e27d20dd62ad560909d3bb8ca519d1095448a3c3'
            '8365c7732d73a99fcce45c3a2500f689f5a63628d667372f4392ddb004094160'
            '13a858c554a1b0ff90ae0335c3a8630a2880aef41f7081c012f1bb58639ca5db'
            '2e73718862eda8ed87d353b6e4ddfa30bf4ac31a29f5f1fee08bd793554916fb'
            '2b7a23fe293ff5d9291fbb29d44817d764ecff3b1358538eba51b013693e7a7a'
            'd7043ded39b604df9b6b63b1a27c9ea2f9795252e8a18ad87e4ac0f390906663'
            'aafa61eb41335e49200cdfabbf1f2a1f720f007f6cfc8225dd6f256fa712379d'
            '7941e3d8d3a3b15bf0167876fdc85ab861067c15dee5fef178dd832e6f63e64a')
noextract=(
  "MapleMono-CN-unhinted.zip"
  "MapleMono-CN.zip"
  "MapleMono-NF-CN-unhinted.zip"
  "MapleMono-NF-CN.zip"
  "MapleMono-NF-unhinted.zip"
  "MapleMono-NF.zip"
  "MapleMono-OTF.zip"
  "MapleMono-TTF-AutoHint.zip"
  "MapleMono-TTF.zip"
  "MapleMono-Variable.zip"
  "MapleMono-Woff2.zip"
)
package_maplemono-cn-unhinted() {
  unzip "MapleMono-CN-unhinted.zip" -d MapleMono-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMono-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMono-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-CN-unhinted" MapleMono-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-CN-unhinted" MapleMono-CN-unhinted/LICENSE.txt
}
package_maplemono-cn() {
  unzip "MapleMono-CN.zip" -d MapleMono-CN
  install -d "$pkgdir/usr/share/fonts/MapleMono-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMono-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-CN" MapleMono-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-CN" MapleMono-CN/LICENSE.txt
}
package_maplemono-nf-cn-unhinted() {
  unzip "MapleMono-NF-CN-unhinted.zip" -d MapleMono-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF-CN-unhinted" MapleMono-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF-CN-unhinted" MapleMono-NF-CN-unhinted/LICENSE.txt
}
package_maplemono-nf-cn() {
  unzip "MapleMono-NF-CN.zip" -d MapleMono-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF-CN" MapleMono-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF-CN" MapleMono-NF-CN/LICENSE.txt
}
package_maplemono-nf-unhinted() {
  unzip "MapleMono-NF-unhinted.zip" -d MapleMono-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF-unhinted" MapleMono-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF-unhinted" MapleMono-NF-unhinted/LICENSE.txt
}
package_maplemono-nf() {
  unzip "MapleMono-NF.zip" -d MapleMono-NF
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF" MapleMono-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF" MapleMono-NF/LICENSE.txt
}
package_maplemono-otf() {
  unzip "MapleMono-OTF.zip" -d MapleMono-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMono-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMono-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-OTF" MapleMono-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-OTF" MapleMono-OTF/LICENSE.txt
}
package_maplemono-ttf-autohint() {
  unzip "MapleMono-TTF-AutoHint.zip" -d MapleMono-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMono-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMono-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-TTF-AutoHint" MapleMono-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-TTF-AutoHint" MapleMono-TTF-AutoHint/LICENSE.txt
}
package_maplemono-ttf() {
  unzip "MapleMono-TTF.zip" -d MapleMono-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMono-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMono-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-TTF" MapleMono-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-TTF" MapleMono-TTF/LICENSE.txt
}
package_maplemono-variable() {
  unzip "MapleMono-Variable.zip" -d MapleMono-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMono-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMono-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-Variable" MapleMono-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-Variable" MapleMono-Variable/LICENSE.txt
}
package_maplemono-woff2() {
  unzip "MapleMono-Woff2.zip" -d MapleMono-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMono-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMono-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-Woff2" MapleMono-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-Woff2" MapleMono-Woff2/LICENSE.txt
}
