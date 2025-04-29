# Maintainer: Cyberczy <czysheep@gmail.com>

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
pkgver="7.2"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
makedepends=("unzip")
source=(
  "MapleMonoNL-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-CN-unhinted.zip"
  "MapleMonoNL-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-CN.zip"
  "MapleMonoNL-NF-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF-CN-unhinted.zip"
  "MapleMonoNL-NF-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF-CN.zip"
  "MapleMonoNL-NF-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF-unhinted.zip"
  "MapleMonoNL-NF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-NF.zip"
  "MapleMonoNL-OTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-OTF.zip"
  "MapleMonoNL-TTF-AutoHint.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-TTF-AutoHint.zip"
  "MapleMonoNL-TTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-TTF.zip"
  "MapleMonoNL-Variable.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-Variable.zip"
  "MapleMonoNL-Woff2.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNL-Woff2.zip"
)
sha256sums=('82a81ddb9664a7583f03977535391ac1bf299c5bfb2134f074ad4940cce27bdc'
            '7d94ccafd486b5a50927b1b020b4346a734cb12e972c316862a6c5d76683ecdd'
            'af5fbc8744e8b1d82e9b4da60d7410b68c706f2543f968ed02474f5d3ef861dd'
            '46e6ea0e636d82dbb31454c3f29e445753c8138cd416d3aab1b4fce1e77ea137'
            '40bc93aaecf95df77f0d9f4d116a8d98070ecc3ca25d5e0acde3cb87364a2fad'
            'ce8fefa06148ffcc13cde5e3f924f338f2bcc445794e79a98342d86de277be02'
            '88ad57961165332f149e361b9ed3a1bd9b4bdc19509860e4e58200c5f69a50a0'
            '299448ec83629eb837c87ac871f168fd96b7e9de7af73d9f5e32ac197057995f'
            'e06eb58e0558d8f7234b845107fb432ae8d9eeb0dd1b8e28e4e61224a41b6e81'
            'ea5c5df1b751116ee5a0e5339c041422f8e1b3ba7f2c3b03ea925b9382663695'
            '3af87afbe073f0289bf41707c60e52626e8d1e0287b97f4c5ba1db98f1ff2c9c')
noextract=(
  "MapleMonoNL-CN-unhinted.zip"
  "MapleMonoNL-CN.zip"
  "MapleMonoNL-NF-CN-unhinted.zip"
  "MapleMonoNL-NF-CN.zip"
  "MapleMonoNL-NF-unhinted.zip"
  "MapleMonoNL-NF.zip"
  "MapleMonoNL-OTF.zip"
  "MapleMonoNL-TTF-AutoHint.zip"
  "MapleMonoNL-TTF.zip"
  "MapleMonoNL-Variable.zip"
  "MapleMonoNL-Woff2.zip"
)
package_maplemononl-cn-unhinted() {
  unzip "MapleMonoNL-CN-unhinted.zip" -d MapleMonoNL-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-CN-unhinted" MapleMonoNL-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-CN-unhinted" MapleMonoNL-CN-unhinted/LICENSE.txt
}
package_maplemononl-cn() {
  unzip "MapleMonoNL-CN.zip" -d MapleMonoNL-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-CN" MapleMonoNL-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-CN" MapleMonoNL-CN/LICENSE.txt
}
package_maplemononl-nf-cn-unhinted() {
  unzip "MapleMonoNL-NF-CN-unhinted.zip" -d MapleMonoNL-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN-unhinted" MapleMonoNL-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN-unhinted" MapleMonoNL-NF-CN-unhinted/LICENSE.txt
}
package_maplemononl-nf-cn() {
  unzip "MapleMonoNL-NF-CN.zip" -d MapleMonoNL-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF-CN" MapleMonoNL-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF-CN" MapleMonoNL-NF-CN/LICENSE.txt
}
package_maplemononl-nf-unhinted() {
  unzip "MapleMonoNL-NF-unhinted.zip" -d MapleMonoNL-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF-unhinted" MapleMonoNL-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF-unhinted" MapleMonoNL-NF-unhinted/LICENSE.txt
}
package_maplemononl-nf() {
  unzip "MapleMonoNL-NF.zip" -d MapleMonoNL-NF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-NF" MapleMonoNL-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-NF" MapleMonoNL-NF/LICENSE.txt
}
package_maplemononl-otf() {
  unzip "MapleMonoNL-OTF.zip" -d MapleMonoNL-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-OTF" MapleMonoNL-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-OTF" MapleMonoNL-OTF/LICENSE.txt
}
package_maplemononl-ttf-autohint() {
  unzip "MapleMonoNL-TTF-AutoHint.zip" -d MapleMonoNL-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-TTF-AutoHint" MapleMonoNL-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-TTF-AutoHint" MapleMonoNL-TTF-AutoHint/LICENSE.txt
}
package_maplemononl-ttf() {
  unzip "MapleMonoNL-TTF.zip" -d MapleMonoNL-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-TTF" MapleMonoNL-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-TTF" MapleMonoNL-TTF/LICENSE.txt
}
package_maplemononl-variable() {
  unzip "MapleMonoNL-Variable.zip" -d MapleMonoNL-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-Variable" MapleMonoNL-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-Variable" MapleMonoNL-Variable/LICENSE.txt
}
package_maplemononl-woff2() {
  unzip "MapleMonoNL-Woff2.zip" -d MapleMonoNL-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMonoNL-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNL-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNL-Woff2" MapleMonoNL-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNL-Woff2" MapleMonoNL-Woff2/LICENSE.txt
}
