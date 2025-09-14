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
pkgver="7.7"
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
sha256sums=('b39143c70724a1b7c8deb67b64c12464f86de23770cdd9c87811fd1b9383d6ee'
            'a1ca4ee74ce1c101cdf59a85ee2cc1aac82626e0a083a3f8095dca483b664cd9'
            'b8cb09527237cf1cfff6db395d8dee861e522b50932bb31f6559c54b78619202'
            'bc101015e32c8c1d3df1b1ab1021813b5909e76fd34516de96eeee02f1614b88'
            '6e237b3c671d9dce2f6e32c027c80ff7e8e6b94f19989010190f653e2d3bbe8b'
            '71deecb6c648e52bf9ba8eec1e98773e8d0d8da250899620e6c291f703285250'
            '8dcac8fe45a1255e183a420b16f8f61de9d1eea2b79acd03d25b1dba55525bed'
            'fb8868156ffb354e34a7e85a6105c46d3aa923f379b7eb5f2ed0f90a1ebc8e0e'
            '60793a95a5032b40d5fd734fdbc06a7aba1e9f80a328a1ed8a8fb2f0372650e4'
            '5a8736d2eca43d0aece94aca28aa0540d644c2d416582ba8e433b6f991cce4a4'
            'bc700c7bc97eadf8f72c43f1eda2859f393ca8e9134c28e8ef4eb5deaf59bb59')
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
