# Maintainer: Cyberczy <czysheep@gmail.com>

pkgbase="maplemononormal"
pkgname=(
  "maplemononormal-cn-unhinted"
  "maplemononormal-cn"
  "maplemononormal-nf-cn-unhinted"
  "maplemononormal-nf-cn"
  "maplemononormal-nf-unhinted"
  "maplemononormal-nf"
  "maplemononormal-otf"
  "maplemononormal-ttf-autohint"
  "maplemononormal-ttf"
  "maplemononormal-variable"
  "maplemononormal-woff2"
)
pkgver="7.0"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
makedepends=("unzip")
source=(
  "MapleMonoNormal-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-CN-unhinted.zip"
  "MapleMonoNormal-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-CN.zip"
  "MapleMonoNormal-NF-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF-CN-unhinted.zip"
  "MapleMonoNormal-NF-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF-CN.zip"
  "MapleMonoNormal-NF-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF-unhinted.zip"
  "MapleMonoNormal-NF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF.zip"
  "MapleMonoNormal-OTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-OTF.zip"
  "MapleMonoNormal-TTF-AutoHint.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-TTF-AutoHint.zip"
  "MapleMonoNormal-TTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-TTF.zip"
  "MapleMonoNormal-Variable.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-Variable.zip"
  "MapleMonoNormal-Woff2.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-Woff2.zip"
)
sha256sums=(
  "130ffb2b028f5a5b85b584430ffd21836ead40254a6022144cda829589dd55f2"
  "3834d607ef674cc9a011aaa5bf5fc5ab8180061e3908b4c0d072961ccf46f40c"
  "bce945c1bd1af7bc9d24f47b61e109aa79938caf69284d8eeaccc61902474a14"
  "e4993f16a77ba4cb8382185a16f21e80f26a2b6d62309b8dfe726df72e6179b7"
  "f4585b0e10671841705f6604d8611ecad788580e73ddbe152705114d6b167f79"
  "48c9ed6745d546c74ba1c49df41b0ddff3919a4522f178134a27142ea106d29a"
  "7e51c638cb9444d7a194bc342736c83cd2d735bec1ee0f185e5f0fa0dfd6aadd"
  "fe08b00791f4150f0d4d8562ab3f3505e77eb96b8e2fd8a91fe08a4b5a77e2f5"
  "bcbe9f47010fd8648e441ace1af120480f9fc63ad9c989a96cd7ae20ca55bd83"
  "4bfefa8b67e3d5ef8a0314250239e018398e331f2de98ed99fce3cef3249257c"
  "82cc942b289b579ab4965362d089f0aa4fd9384105fa91f56427fdb0c69d91cf"
)
noextract=(
  "MapleMonoNormal-CN-unhinted.zip"
  "MapleMonoNormal-CN.zip"
  "MapleMonoNormal-NF-CN-unhinted.zip"
  "MapleMonoNormal-NF-CN.zip"
  "MapleMonoNormal-NF-unhinted.zip"
  "MapleMonoNormal-NF.zip"
  "MapleMonoNormal-OTF.zip"
  "MapleMonoNormal-TTF-AutoHint.zip"
  "MapleMonoNormal-TTF.zip"
  "MapleMonoNormal-Variable.zip"
  "MapleMonoNormal-Woff2.zip"
)
package_maplemononormal-cn-unhinted() {
  unzip "MapleMonoNormal-CN-unhinted.zip" -d MapleMonoNormal-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-CN-unhinted" MapleMonoNormal-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-CN-unhinted" MapleMonoNormal-CN-unhinted/LICENSE.txt
}
package_maplemononormal-cn() {
  unzip "MapleMonoNormal-CN.zip" -d MapleMonoNormal-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-CN" MapleMonoNormal-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-CN" MapleMonoNormal-CN/LICENSE.txt
}
package_maplemononormal-nf-cn-unhinted() {
  unzip "MapleMonoNormal-NF-CN-unhinted.zip" -d MapleMonoNormal-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN-unhinted" MapleMonoNormal-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN-unhinted" MapleMonoNormal-NF-CN-unhinted/LICENSE.txt
}
package_maplemononormal-nf-cn() {
  unzip "MapleMonoNormal-NF-CN.zip" -d MapleMonoNormal-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN" MapleMonoNormal-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN" MapleMonoNormal-NF-CN/LICENSE.txt
}
package_maplemononormal-nf-unhinted() {
  unzip "MapleMonoNormal-NF-unhinted.zip" -d MapleMonoNormal-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-unhinted" MapleMonoNormal-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-unhinted" MapleMonoNormal-NF-unhinted/LICENSE.txt
}
package_maplemononormal-nf() {
  unzip "MapleMonoNormal-NF.zip" -d MapleMonoNormal-NF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF" MapleMonoNormal-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF" MapleMonoNormal-NF/LICENSE.txt
}
package_maplemononormal-otf() {
  unzip "MapleMonoNormal-OTF.zip" -d MapleMonoNormal-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-OTF" MapleMonoNormal-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-OTF" MapleMonoNormal-OTF/LICENSE.txt
}
package_maplemononormal-ttf-autohint() {
  unzip "MapleMonoNormal-TTF-AutoHint.zip" -d MapleMonoNormal-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF-AutoHint" MapleMonoNormal-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF-AutoHint" MapleMonoNormal-TTF-AutoHint/LICENSE.txt
}
package_maplemononormal-ttf() {
  unzip "MapleMonoNormal-TTF.zip" -d MapleMonoNormal-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF" MapleMonoNormal-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF" MapleMonoNormal-TTF/LICENSE.txt
}
package_maplemononormal-variable() {
  unzip "MapleMonoNormal-Variable.zip" -d MapleMonoNormal-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-Variable" MapleMonoNormal-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-Variable" MapleMonoNormal-Variable/LICENSE.txt
}
package_maplemononormal-woff2() {
  unzip "MapleMonoNormal-Woff2.zip" -d MapleMonoNormal-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-Woff2" MapleMonoNormal-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-Woff2" MapleMonoNormal-Woff2/LICENSE.txt
}
