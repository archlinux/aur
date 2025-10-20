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
pkgver="7.8"
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
sha256sums=('30c5011548b1ad761b2a34e35ae4133d8ebf29320614589859ff6c441913cdde'
            '10b33a04a5a6607d726589f10de3cd47cd9a3a1ebeaacaa074bce1d51d8b9a43'
            '22481b659a2f10f40c7129ee6d87f55eac31a568014a3e9407a7533ce4af13ac'
            '1dc77a98e27e5d16ad122f5e747e1af711c5e025b863009a4353aa3700a189d9'
            '2b2ca7b45a19d44b0e79a7d0e7b7e67810e8d4b504dc42e6d0a096728401a983'
            'd62554eacd1a857b6dc18e878b1511856104915bbcb5625ff249a27a229d1fed'
            '6cefc1b5b9ee13fbae2f01c6fe2ec66df67ebbd0a92a2b20656a0009dd046b40'
            '8a1200498a92b019049c91c95d9a8bbedc3656b9aba5dc4ed5e0cd0591cfe8bf'
            '0c7a8510da1afc067b58efd5f628631715811f71ac3fc32d8629a4fca7a1cf7d'
            'abbae9ed3fbfd1ef1e0ef4648b9a99e761e6f84a267905e8e1e6dab6aff846b1'
            '851bd024941d9b7884ff383a22a56b5326842b5310d4b189f0370777d27ab076')
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
