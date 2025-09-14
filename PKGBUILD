# Maintainer: Cyberczy <czysheep@gmail.com>
# Contributor: Regniox <regniox@outlook.com>

pkgbase="maplemononl"
pkgname=(
  "maplemononl-cn-unhinted"
  "maplemononl-cn"
  "maplemononl-nf-cn-unhinted"
  "maplemononl-nf-cn"
  "maplemononl-nf-unhinted"
  "maplemononl-nf"
  "maplemononl-otf"
  "maplemononl-ttf-autohint"
  "maplemononl-ttf"
  "maplemononl-variable"
  "maplemononl-woff2"
)
pkgver="7.7"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
source=(
  "MapleMonoNL-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-CN-unhinted.zip"
  "MapleMonoNL-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-CN.zip"
  "MapleMonoNL-NF-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF-CN-unhinted.zip"
  "MapleMonoNL-NF-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF-CN.zip"
  "MapleMonoNL-NF-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF-unhinted.zip"
  "MapleMonoNL-NF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF.zip"
  "MapleMonoNL-OTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-OTF.zip"
  "MapleMonoNL-TTF-AutoHint-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-TTF-AutoHint.zip"
  "MapleMonoNL-TTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-TTF.zip"
  "MapleMonoNL-Variable-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-Variable.zip"
  "MapleMonoNL-Woff2-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-Woff2.zip"
)
sha256sums=('6a95fc262ff583119c884ddcc825fd9f483821533c63edb78af3ccc5ca0859ea'
            'cfaba46cb2f5f92ddcccbdf22690379407ad61bac8cb9ca78584e2fb73337857'
            'b78b45379a3f9d83c53725ac1a092021a0aa78bcdcd5d892b6b6c94d3826189a'
            '27d2487e448ac2773b1c60642c4f708330bde5799bad14cef5452a4ecf404a61'
            '926b128d5d622d360c381977e5379ed23404a7fea9706cdd99964c5c4c497568'
            '819e698b86cbba3ee20a0827dcf8e02652be0477c8ebdbc339f83b9cf829c11d'
            'c674542c4a637cdd74c8960e7b7d1de6b827b6d96409dfa1e6d29d80e89d8bfd'
            'f2fb7047576fc49b009c4cea1ea52b17903d9938f396cd4d54d2a832100f4c0e'
            '09e7d91110442a0cec7fe48e9e822c2bd3cdf28570c040721b470efc122fac81'
            'f15e58d657a490c9f56060ba1097a0b735c6d1380141112899329a132a5b3c51'
            '6fbb0afb0dc683aebd5719af4090fd0f6602371321ffeb6c4d423ea707d6eb77')
noextract=(
  "MapleMonoNL-CN-unhinted-$pkgver.zip"
  "MapleMonoNL-CN-$pkgver.zip"
  "MapleMonoNL-NF-CN-unhinted-$pkgver.zip"
  "MapleMonoNL-NF-CN-$pkgver.zip"
  "MapleMonoNL-NF-unhinted-$pkgver.zip"
  "MapleMonoNL-NF-$pkgver.zip"
  "MapleMonoNL-OTF-$pkgver.zip"
  "MapleMonoNL-TTF-AutoHint-$pkgver.zip"
  "MapleMonoNL-TTF-$pkgver.zip"
  "MapleMonoNL-Variable-$pkgver.zip"
  "MapleMonoNL-Woff2-$pkgver.zip"
)
package_maplemononl-cn-unhinted() {
  bsdunzip "MapleMonoNL-CN-unhinted-$pkgver.zip" -d MapleMonoNL-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-CN-unhinted" MapleMonoNL-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-CN-unhinted" MapleMonoNL-CN-unhinted/LICENSE.txt
}
package_maplemononl-cn() {
  bsdunzip "MapleMonoNL-CN-$pkgver.zip" -d MapleMonoNL-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-CN" MapleMonoNL-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-CN" MapleMonoNL-CN/LICENSE.txt
}
package_maplemononl-nf-cn-unhinted() {
  bsdunzip "MapleMonoNL-NF-CN-unhinted-$pkgver.zip" -d MapleMonoNL-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN-unhinted" MapleMonoNL-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN-unhinted" MapleMonoNL-NF-CN-unhinted/LICENSE.txt
}
package_maplemononl-nf-cn() {
  bsdunzip "MapleMonoNL-NF-CN-$pkgver.zip" -d MapleMonoNL-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN" MapleMonoNL-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN" MapleMonoNL-NF-CN/LICENSE.txt
}
package_maplemononl-nf-unhinted() {
  bsdunzip "MapleMonoNL-NF-unhinted-$pkgver.zip" -d MapleMonoNL-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF-unhinted" MapleMonoNL-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF-unhinted" MapleMonoNL-NF-unhinted/LICENSE.txt
}
package_maplemononl-nf() {
  bsdunzip "MapleMonoNL-NF-$pkgver.zip" -d MapleMonoNL-NF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF" MapleMonoNL-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF" MapleMonoNL-NF/LICENSE.txt
}
package_maplemononl-otf() {
  bsdunzip "MapleMonoNL-OTF-$pkgver.zip" -d MapleMonoNL-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-OTF" MapleMonoNL-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-OTF" MapleMonoNL-OTF/LICENSE.txt
}
package_maplemononl-ttf-autohint() {
  bsdunzip "MapleMonoNL-TTF-AutoHint-$pkgver.zip" -d MapleMonoNL-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-TTF-AutoHint" MapleMonoNL-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-TTF-AutoHint" MapleMonoNL-TTF-AutoHint/LICENSE.txt
}
package_maplemononl-ttf() {
  bsdunzip "MapleMonoNL-TTF-$pkgver.zip" -d MapleMonoNL-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-TTF" MapleMonoNL-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-TTF" MapleMonoNL-TTF/LICENSE.txt
}
package_maplemononl-variable() {
  bsdunzip "MapleMonoNL-Variable-$pkgver.zip" -d MapleMonoNL-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-Variable" MapleMonoNL-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-Variable" MapleMonoNL-Variable/LICENSE.txt
}
package_maplemononl-woff2() {
  bsdunzip "MapleMonoNL-Woff2-$pkgver.zip" -d MapleMonoNL-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-Woff2" MapleMonoNL-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-Woff2" MapleMonoNL-Woff2/LICENSE.txt
}
