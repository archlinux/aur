# Maintainer: Cyberczy <czysheep@gmail.com>
# Contributor: Regniox <regniox@outlook.com>

pkgbase="maplemononormalnl"
pkgname=(
  "maplemononormalnl-cn-unhinted"
  "maplemononormalnl-cn"
  "maplemononormalnl-nf-cn-unhinted"
  "maplemononormalnl-nf-cn"
  "maplemononormalnl-nf-unhinted"
  "maplemononormalnl-nf"
  "maplemononormalnl-otf"
  "maplemononormalnl-ttf-autohint"
  "maplemononormalnl-ttf"
  "maplemononormalnl-variable"
  "maplemononormalnl-woff2"
)
pkgver="7.5"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
source=(
  "MapleMonoNormalNL-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-CN-unhinted.zip"
  "MapleMonoNormalNL-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-CN.zip"
  "MapleMonoNormalNL-NF-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF-CN-unhinted.zip"
  "MapleMonoNormalNL-NF-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF-CN.zip"
  "MapleMonoNormalNL-NF-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF-unhinted.zip"
  "MapleMonoNormalNL-NF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF.zip"
  "MapleMonoNormalNL-OTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-OTF.zip"
  "MapleMonoNormalNL-TTF-AutoHint-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-TTF-AutoHint.zip"
  "MapleMonoNormalNL-TTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-TTF.zip"
  "MapleMonoNormalNL-Variable-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-Variable.zip"
  "MapleMonoNormalNL-Woff2-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-Woff2.zip"
)
sha256sums=('594be01a45bd0b78d280e49fb22f13f053c3a446bd1614b38a211d2e4dd60e0a'
            '93811b2062d4968f3a75f351aba56cf952a7ed8cb168f8cfa678f3e67646c36f'
            '034326fde392ab4a90001694fbf1eeef7656c2c96f7822fb833e3e54cfeffac5'
            'bc88f5f9428828095e6c05bc4e98fbf87ab448f88283c7716b63528b0e014405'
            'cd23ca6864d996b0a07cc9eb6817fc206e103209a67f93165c870b26cc5472ad'
            'e89ac787b6521a1ba39dfa0afa535040af22e4cb2a5c2728e96a7e12531a4a0c'
            'b20e99f40903552e1188a596d545d3a3039c361ea10cc751309e0341bfdc8804'
            '7a9189facfbcdabb29777103c5ded1e08774019d4389f5beef6e3e8f4d4bc9d0'
            'c41ef7fcc1e2284c67f861c87b38e4da6b1d93dc7e34850cf6f26b2678636056'
            '9e92d61370697ba022deb824c783cd46ce6cd83eea0d338a56f5e2f3db326034'
            '3315e63bc750130bc0daa499dd483922adff6a4857a874d20bc30ff6e5efa895')
noextract=(
  "MapleMonoNormalNL-CN-unhinted-$pkgver.zip"
  "MapleMonoNormalNL-CN-$pkgver.zip"
  "MapleMonoNormalNL-NF-CN-unhinted-$pkgver.zip"
  "MapleMonoNormalNL-NF-CN-$pkgver.zip"
  "MapleMonoNormalNL-NF-unhinted-$pkgver.zip"
  "MapleMonoNormalNL-NF-$pkgver.zip"
  "MapleMonoNormalNL-OTF-$pkgver.zip"
  "MapleMonoNormalNL-TTF-AutoHint-$pkgver.zip"
  "MapleMonoNormalNL-TTF-$pkgver.zip"
  "MapleMonoNormalNL-Variable-$pkgver.zip"
  "MapleMonoNormalNL-Woff2-$pkgver.zip"
)
package_maplemononormalnl-cn-unhinted() {
  bsdunzip "MapleMonoNormalNL-CN-unhinted-$pkgver.zip" -d MapleMonoNormalNL-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN-unhinted" MapleMonoNormalNL-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN-unhinted" MapleMonoNormalNL-CN-unhinted/LICENSE.txt
}
package_maplemononormalnl-cn() {
  bsdunzip "MapleMonoNormalNL-CN-$pkgver.zip" -d MapleMonoNormalNL-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN" MapleMonoNormalNL-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN" MapleMonoNormalNL-CN/LICENSE.txt
}
package_maplemononormalnl-nf-cn-unhinted() {
  bsdunzip "MapleMonoNormalNL-NF-CN-unhinted-$pkgver.zip" -d MapleMonoNormalNL-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN-unhinted" MapleMonoNormalNL-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN-unhinted" MapleMonoNormalNL-NF-CN-unhinted/LICENSE.txt
}
package_maplemononormalnl-nf-cn() {
  bsdunzip "MapleMonoNormalNL-NF-CN-$pkgver.zip" -d MapleMonoNormalNL-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN" MapleMonoNormalNL-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN" MapleMonoNormalNL-NF-CN/LICENSE.txt
}
package_maplemononormalnl-nf-unhinted() {
  bsdunzip "MapleMonoNormalNL-NF-unhinted-$pkgver.zip" -d MapleMonoNormalNL-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-unhinted" MapleMonoNormalNL-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-unhinted" MapleMonoNormalNL-NF-unhinted/LICENSE.txt
}
package_maplemononormalnl-nf() {
  bsdunzip "MapleMonoNormalNL-NF-$pkgver.zip" -d MapleMonoNormalNL-NF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF" MapleMonoNormalNL-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF" MapleMonoNormalNL-NF/LICENSE.txt
}
package_maplemononormalnl-otf() {
  bsdunzip "MapleMonoNormalNL-OTF-$pkgver.zip" -d MapleMonoNormalNL-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-OTF" MapleMonoNormalNL-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-OTF" MapleMonoNormalNL-OTF/LICENSE.txt
}
package_maplemononormalnl-ttf-autohint() {
  bsdunzip "MapleMonoNormalNL-TTF-AutoHint-$pkgver.zip" -d MapleMonoNormalNL-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF-AutoHint" MapleMonoNormalNL-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF-AutoHint" MapleMonoNormalNL-TTF-AutoHint/LICENSE.txt
}
package_maplemononormalnl-ttf() {
  bsdunzip "MapleMonoNormalNL-TTF-$pkgver.zip" -d MapleMonoNormalNL-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF" MapleMonoNormalNL-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF" MapleMonoNormalNL-TTF/LICENSE.txt
}
package_maplemononormalnl-variable() {
  bsdunzip "MapleMonoNormalNL-Variable-$pkgver.zip" -d MapleMonoNormalNL-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Variable" MapleMonoNormalNL-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Variable" MapleMonoNormalNL-Variable/LICENSE.txt
}
package_maplemononormalnl-woff2() {
  bsdunzip "MapleMonoNormalNL-Woff2-$pkgver.zip" -d MapleMonoNormalNL-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Woff2" MapleMonoNormalNL-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Woff2" MapleMonoNormalNL-Woff2/LICENSE.txt
}
