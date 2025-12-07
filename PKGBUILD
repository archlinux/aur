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
pkgver="7.9"
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
sha256sums=('d41cb72721e99cfe4fbd1a7b0f182a013457de46aa612018f924dd024699d3b9'
            'cb1e79b2c23dff772ae351784ef2b84454a61b3920e9b20bd5db4bf207e4472d'
            'ab88522932cf4015dffeaef6dedc59a22a5fefecdcc6e583d9fcd997da5b7cac'
            'af913b6322905348b3f50e4397fedc35b3a880db5effcce7969003051dcd3e94'
            '8248d6260660be1066b5ebe90d25131582df8383f38db1c284dd1f2dc9d2b46e'
            '59098b87c895d871635d37680e88000ae2b2b25b55428195b228ec589e35fb89'
            'ecf47b851ae4001b00564399511af8dc9615339d3ae9ded54e8547d6d1ad3da1'
            'c83b45a07dcdceacbd49986a862b56f60f31c8b976546faea1a3f2ba3dba4035'
            '3a35f8f0669bef3dded9df208cc4526a6f7573210e134816e9084a8981271d75'
            'b9e57677cc4ec069ce178bd965d66cd14bd26c12e37d89d786ff959339bf8c93'
            '5e38e83b007e7157c253c3f57c0a6f80415378f4859d43eb3cf4b1d858001681')
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
