# Maintainer: Cyberczy <czysheep@gmail.com>

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
pkgver="7.4"
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
sha256sums=('749d928be97e350002f9aacec4e86f045cb2e6ebd65912a1dd10fad9f48897c4'
            'fdce6353b3ba33e86745866e14357183f3c0fb093be4776594d5f92086abc369'
            '02de88f5e486ac5fbd6961792f67f86f66b73d6ab87abed8327619260e31c02f'
            '1151e8154e0f4246c792795f11f69f6330cac0fc1f42c01dfb5a19693f2179aa'
            'e5a706bd47053d031d4a1f422bb3164bf34da39d9e883a54881462547debb33e'
            '6365d2341f7108e1b1f72d5f9c41c6ced2bb73d06301d623e0f1f6f85b7d710f'
            '4a9f35b64dad78a93d7e0ee9d0b27408b5e6a21eb965c14d8bf04e5737a61aa4'
            '24a3e049939ac6a4d296ca84a9b7e8eab6b6ecba82c73151a5eefc6945ae9c1c'
            '299041e1fc90993515c17b110bccaa899b46f440f78ac8fae3fb44f2c0e0492e'
            'f793afa8eb3daa8ff7f143e7196182179486c6b4569c413a3964fc33427a5d8d'
            '07045af41a6401ef13c389a7d7afa0e35677822215a3125319d0b6564df49608')
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
