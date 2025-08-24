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
pkgver="7.6"
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
sha256sums=('5d3edc9c326c8cd9bc3853ea9c158c6ab81c696a3d9e5efb2bee3e0c7b98678c'
            'ea89032ccc2d5e02221df49aa7028f93b64a492c464c11c5ce0e524e68133bd4'
            'eb140f10094c8c415bd016934aa0bfe107c2719603f2e5183033a019516a76bb'
            'cf5c506bcf5ec793387ce9e5df4032d0ef9e569b8fe7ae383a9455c04e2cf2aa'
            'ec104ede7514c457ff35dd42581ba436318885ce4c9af07c47b0795749d327a2'
            'c9df075129ac4ead9175335a2b482487c5a93dfb9ff77bcc503f5264e538d79b'
            '9cd6ce25ea961b9e485d699284c31bd984eb8d07b9633e40d32db3c3057d8ab2'
            'fc3a64ec76fb87f54253974747c03256bac94c63471c1e8e318f397893613215'
            'c9d16e60480af28e7bb3aee52b5640c704c1a6e33b7c714665a99087b62665c2'
            '29c583c72a76fe475e8622f7fde135237deca3ea51ee2165e334ac292ca0b161'
            '7f931a0dd7da060c5e474ac6941afa2eb0aac8f6a56637367df5156ab0f6e1ac')
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
