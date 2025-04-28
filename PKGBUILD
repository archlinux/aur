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
pkgver="7.1"
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
sha256sums=('0f807e2809326ef7d54be1f3b68613085f90b3d971ae1d5d7b66c13d405d3baf'
            'eb7a9f7afba9bad79ec045da57909b8d29ce43ab6a5cd3f037ae419e44d771fd'
            'a8ba9c7422f7b820d6e900f1f96dfd1dc2f7af7d3744d8c4b84862037f184585'
            'f60c63b21f63ed395cd59e6768aecf4a9a5b56223a719b65aa4ebfe4986fb791'
            '86710b1b3f33a50fe7d8f8f7496a9dbae7e59880614fef0c77a73940c5e1cdde'
            '67353e3e0adacc4ce24f1f28a0d9248ea00fc0570cd443d00514a4926dc2eb42'
            '371a6fef8f34eb89a9e4bcf896f742533f63598efc75530e4a50b51410cebf0b'
            '47564da333511d8b4d5daafdeb0dd5d6a9306c039609d31932684aec3b72aace'
            'eda14c302c6b7830f62a7a6022dfe0718032a7ea4d12d75f4a04ffe1a38cfcff'
            '172688018a5d0ce8fa2032c9514df7620ed5a842b454dfe7f766f62382eb75c0'
            '9717018e09a780567552105e8f7944f88a8ac6f4280c4e6b1f7fbe87808dd1a7')
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
