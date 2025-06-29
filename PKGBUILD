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
pkgver="7.4"
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
sha256sums=('2aa172be629e0e2cc3d4b95a47e2f792221e5d27beed5a1a309195d7f34ccfff'
            '1c901643f0f0dcca5f8dc73be7a6aab943ec44b80abfbb4dff0f230d9878c59e'
            '8608ca98a49c8e7ddeae92a005eb737fb8a225ae5661d0b82734d942419ba8d8'
            'a8806175b252c3dc3d93c561fe0a06d85e3a62f867d5aa5eaa549b903db29f54'
            '508f0e02dd0fb915d87a4e20b60d34cd96982a2362656c7973bf62ceafde01b6'
            'f14949bbdea02f55e1645b359659806a2b07f8ab0862c5c0f4322a07610c7e3a'
            '38e6bf7ad31042f9abaea0b8659bb84302c79ec52dca929bd34bc6969f18da3e'
            '790ca4d4b47e75f7f75317d3fc8d110a0534b299b52d646866d4349b42541911'
            '69186d2926f352cd7bf6eb115213a9b05332acce1daa1ef1b79998d0f3ac911e'
            'd6e7963547de6af1271f11f8839421722ffe2f1a1b47066ae294ec8f8bf5a2ce'
            'e59442965f6babbf68027afd5a05b180d16d71d2fc96363bdb00d99eca31e5b2')
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
