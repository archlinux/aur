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
pkgver="7.8"
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
sha256sums=('2f5b244f2d3be780cb52ba8f742eee12809b5510754c78bed481a4b2fc8a2c83'
            '7f6b73728b49e26a0973d4087bf1946f6ab5a934f4dd2453ef4ce26efc02b1db'
            '7edbedaff33ea80ca0526b9539a9dfda2ab45cad4cf6a9509cb78726c4f1e0a1'
            'be2300a0576a85ee4fab7dc7d124eb323f70cc6d7dec4dd1674b7d2ed1ca1ca2'
            'f17cffe9c77ab42bb19f6e5ba7bad64329a475f1ddac72f78476026288542f7a'
            '75d6e4c3948d9fcddc8e4613205350965bbd583c1af0c7cde25f2745b251cafd'
            '2b02d64ea7ced0c194820b796ce18da091530fe0d3c96a8a781a61468cc0d5db'
            '6d0248f13b914718d38bc810f8b493ad19ecccba8d2a90fc2cc2087f4beb73e5'
            '9f51399c8f59fc6ae9dded1d4cad53b2430d5915ef66cbac54cde05b4ab3edf0'
            '2a1253353763a114085a9fa606c9eb6908cf5b2cc79ad8e72c7bf3675dc04a33'
            '8c546c8990a3279dd2f21f164a15b410bc039d08824d2fa423417f549cf2bf94')
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
