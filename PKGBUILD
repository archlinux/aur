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
pkgver="7.3"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
source=(
  "MapleMonoNormal-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-CN-unhinted.zip"
  "MapleMonoNormal-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-CN.zip"
  "MapleMonoNormal-NF-CN-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF-CN-unhinted.zip"
  "MapleMonoNormal-NF-CN-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF-CN.zip"
  "MapleMonoNormal-NF-unhinted-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF-unhinted.zip"
  "MapleMonoNormal-NF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-NF.zip"
  "MapleMonoNormal-OTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-OTF.zip"
  "MapleMonoNormal-TTF-AutoHint-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-TTF-AutoHint.zip"
  "MapleMonoNormal-TTF-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-TTF.zip"
  "MapleMonoNormal-Variable-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-Variable.zip"
  "MapleMonoNormal-Woff2-$pkgver.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormal-Woff2.zip"
)
sha256sums=('f740762f807f33bdfa467c21c9bab16ab1e6854ad806b7042185bff3d9f0af43'
            '3332fb0126f0daa2591d83bac62abb93445aded16ff721a54bc482cc93332716'
            '6cb3a2c558e91c2bf3f64e14fa443705c6d801f3372e401bff4e8549543e2b0b'
            '47c9f3be4bc9efc6ecc9239b69bd6ee1f6296098b8f3cc4b5534689f40bcca14'
            '3bd72416604d1e54778aafaeeaeb6abc45947b7a1e62b106210768c97f39bf6f'
            'abe15544f5b2ab99b245c937914a049bffe91cce6a2220a586380d0ad3fb7ff9'
            '45b1ff4d9a742f9d940a9f096e2b74e571d883e284484475d618e6807726ee58'
            'f80db38de72a7a853d7ba89a027e8d439694f3a0bac04ebcf1027b4631af6f11'
            '7140bdbadcb48ae7729b5af72cd47e858a1621ebf22225c2d0c6cad44a65e92e'
            '95da478800e4039f21ad1c67ccb26db098a67227303e7e824930fd922e1ce63b'
            '609124f131d40e1159fa678226f808c33d31d195c2afcee6dcd0a38f24bc9477')
noextract=(
  "MapleMonoNormal-CN-unhinted-$pkgver.zip"
  "MapleMonoNormal-CN-$pkgver.zip"
  "MapleMonoNormal-NF-CN-unhinted-$pkgver.zip"
  "MapleMonoNormal-NF-CN-$pkgver.zip"
  "MapleMonoNormal-NF-unhinted-$pkgver.zip"
  "MapleMonoNormal-NF-$pkgver.zip"
  "MapleMonoNormal-OTF-$pkgver.zip"
  "MapleMonoNormal-TTF-AutoHint-$pkgver.zip"
  "MapleMonoNormal-TTF-$pkgver.zip"
  "MapleMonoNormal-Variable-$pkgver.zip"
  "MapleMonoNormal-Woff2-$pkgver.zip"
)
package_maplemononormal-cn-unhinted() {
  bsdunzip "MapleMonoNormal-CN-unhinted-$pkgver.zip" -d MapleMonoNormal-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-CN-unhinted" MapleMonoNormal-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-CN-unhinted" MapleMonoNormal-CN-unhinted/LICENSE.txt
}
package_maplemononormal-cn() {
  bsdunzip "MapleMonoNormal-CN-$pkgver.zip" -d MapleMonoNormal-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-CN" MapleMonoNormal-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-CN" MapleMonoNormal-CN/LICENSE.txt
}
package_maplemononormal-nf-cn-unhinted() {
  bsdunzip "MapleMonoNormal-NF-CN-unhinted-$pkgver.zip" -d MapleMonoNormal-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN-unhinted" MapleMonoNormal-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN-unhinted" MapleMonoNormal-NF-CN-unhinted/LICENSE.txt
}
package_maplemononormal-nf-cn() {
  bsdunzip "MapleMonoNormal-NF-CN-$pkgver.zip" -d MapleMonoNormal-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-CN" MapleMonoNormal-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-CN" MapleMonoNormal-NF-CN/LICENSE.txt
}
package_maplemononormal-nf-unhinted() {
  bsdunzip "MapleMonoNormal-NF-unhinted-$pkgver.zip" -d MapleMonoNormal-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF-unhinted" MapleMonoNormal-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF-unhinted" MapleMonoNormal-NF-unhinted/LICENSE.txt
}
package_maplemononormal-nf() {
  bsdunzip "MapleMonoNormal-NF-$pkgver.zip" -d MapleMonoNormal-NF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-NF" MapleMonoNormal-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-NF" MapleMonoNormal-NF/LICENSE.txt
}
package_maplemononormal-otf() {
  bsdunzip "MapleMonoNormal-OTF-$pkgver.zip" -d MapleMonoNormal-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-OTF" MapleMonoNormal-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-OTF" MapleMonoNormal-OTF/LICENSE.txt
}
package_maplemononormal-ttf-autohint() {
  bsdunzip "MapleMonoNormal-TTF-AutoHint-$pkgver.zip" -d MapleMonoNormal-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF-AutoHint" MapleMonoNormal-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF-AutoHint" MapleMonoNormal-TTF-AutoHint/LICENSE.txt
}
package_maplemononormal-ttf() {
  bsdunzip "MapleMonoNormal-TTF-$pkgver.zip" -d MapleMonoNormal-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-TTF" MapleMonoNormal-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-TTF" MapleMonoNormal-TTF/LICENSE.txt
}
package_maplemononormal-variable() {
  bsdunzip "MapleMonoNormal-Variable-$pkgver.zip" -d MapleMonoNormal-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-Variable" MapleMonoNormal-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-Variable" MapleMonoNormal-Variable/LICENSE.txt
}
package_maplemononormal-woff2() {
  bsdunzip "MapleMonoNormal-Woff2-$pkgver.zip" -d MapleMonoNormal-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormal-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormal-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormal-Woff2" MapleMonoNormal-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormal-Woff2" MapleMonoNormal-Woff2/LICENSE.txt
}
