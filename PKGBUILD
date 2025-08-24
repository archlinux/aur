# Maintainer: Cyberczy <czysheep@gmail.com>
# Contributor: Regniox <regniox@outlook.com>

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
pkgver="7.6"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
source=(
  "MapleMono-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-CN-unhinted.zip"
  "MapleMono-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-CN.zip"
  "MapleMono-NF-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN-unhinted.zip"
  "MapleMono-NF-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN.zip"
  "MapleMono-NF-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-unhinted.zip"
  "MapleMono-NF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
  "MapleMono-OTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-OTF.zip"
  "MapleMono-TTF-AutoHint-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-TTF-AutoHint.zip"
  "MapleMono-TTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-TTF.zip"
  "MapleMono-Variable-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-Variable.zip"
  "MapleMono-Woff2-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-Woff2.zip"
)
sha256sums=('49fc3a94aa07f3c0441cb3115be876880c9d69ea6a8a5b72f41f97be9a3b598e'
            '02ef49fed39a67fd6306ef9828ac915b3aa14b94a4cefb5bbabf4702df93f537'
            '3bd076e9e0a0cd48397fe836abe4c299c34245a0c4ee043c5653159626f3e085'
            '206e1064d5611ffb18f8950088b54ffef4e8d53858c28205bd7d5c02b6180ba3'
            '2d496c8a5ac02daf3477d9a10e193c694489e9fa8d26193628b51086d5ee07a4'
            '51da1afc4ae7d2803bf38849c720e9a11c2c9f4accdcdef9eb9224bdb098628f'
            'd25858996a461d5b33f17a78313b91bba293c63a3746ebb4323cec69144f6380'
            '286dcb5effa533a3aa73439846b4f22883283f8d33509ac2843a3cfb8ff6d45d'
            '495b9a8691f4a041dd378a318b6d57f819ac86751d3f599c6937a38bce6fdcbc'
            '2a9b0c9b1f76708f690fcc9a014c93b6c945b6af02a59ee21125b7799b742f15'
            'da9e9b013fceff6321f2ecf53a27635e196c66eb12a5e3b0e461ae78f0266e90')
noextract=(
  "MapleMono-CN-unhinted-$pkgver.zip"
  "MapleMono-CN-$pkgver.zip"
  "MapleMono-NF-CN-unhinted-$pkgver.zip"
  "MapleMono-NF-CN-$pkgver.zip"
  "MapleMono-NF-unhinted-$pkgver.zip"
  "MapleMono-NF-$pkgver.zip"
  "MapleMono-OTF-$pkgver.zip"
  "MapleMono-TTF-AutoHint-$pkgver.zip"
  "MapleMono-TTF-$pkgver.zip"
  "MapleMono-Variable-$pkgver.zip"
  "MapleMono-Woff2-$pkgver.zip"
)
package_maplemono-cn-unhinted() {
  bsdunzip "MapleMono-CN-unhinted-$pkgver.zip" -d MapleMono-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMono-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMono-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-CN-unhinted" MapleMono-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-CN-unhinted" MapleMono-CN-unhinted/LICENSE.txt
}
package_maplemono-cn() {
  bsdunzip "MapleMono-CN-$pkgver.zip" -d MapleMono-CN
  install -d "$pkgdir/usr/share/fonts/MapleMono-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMono-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-CN" MapleMono-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-CN" MapleMono-CN/LICENSE.txt
}
package_maplemono-nf-cn-unhinted() {
  bsdunzip "MapleMono-NF-CN-unhinted-$pkgver.zip" -d MapleMono-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF-CN-unhinted" MapleMono-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF-CN-unhinted" MapleMono-NF-CN-unhinted/LICENSE.txt
}
package_maplemono-nf-cn() {
  bsdunzip "MapleMono-NF-CN-$pkgver.zip" -d MapleMono-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF-CN" MapleMono-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF-CN" MapleMono-NF-CN/LICENSE.txt
}
package_maplemono-nf-unhinted() {
  bsdunzip "MapleMono-NF-unhinted-$pkgver.zip" -d MapleMono-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF-unhinted" MapleMono-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF-unhinted" MapleMono-NF-unhinted/LICENSE.txt
}
package_maplemono-nf() {
  bsdunzip "MapleMono-NF-$pkgver.zip" -d MapleMono-NF
  install -d "$pkgdir/usr/share/fonts/MapleMono-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMono-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-NF" MapleMono-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-NF" MapleMono-NF/LICENSE.txt
}
package_maplemono-otf() {
  bsdunzip "MapleMono-OTF-$pkgver.zip" -d MapleMono-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMono-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMono-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-OTF" MapleMono-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-OTF" MapleMono-OTF/LICENSE.txt
}
package_maplemono-ttf-autohint() {
  bsdunzip "MapleMono-TTF-AutoHint-$pkgver.zip" -d MapleMono-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMono-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMono-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-TTF-AutoHint" MapleMono-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-TTF-AutoHint" MapleMono-TTF-AutoHint/LICENSE.txt
}
package_maplemono-ttf() {
  bsdunzip "MapleMono-TTF-$pkgver.zip" -d MapleMono-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMono-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMono-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-TTF" MapleMono-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-TTF" MapleMono-TTF/LICENSE.txt
}
package_maplemono-variable() {
  bsdunzip "MapleMono-Variable-$pkgver.zip" -d MapleMono-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMono-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMono-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-Variable" MapleMono-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-Variable" MapleMono-Variable/LICENSE.txt
}
package_maplemono-woff2() {
  bsdunzip "MapleMono-Woff2-$pkgver.zip" -d MapleMono-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMono-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMono-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMono-Woff2" MapleMono-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMono-Woff2" MapleMono-Woff2/LICENSE.txt
}
