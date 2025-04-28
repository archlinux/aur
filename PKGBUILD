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
pkgver="7.1"
pkgrel="1"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
makedepends=("unzip")
source=(
  "MapleMonoNormalNL-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-CN-unhinted.zip"
  "MapleMonoNormalNL-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-CN.zip"
  "MapleMonoNormalNL-NF-CN-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF-CN-unhinted.zip"
  "MapleMonoNormalNL-NF-CN.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF-CN.zip"
  "MapleMonoNormalNL-NF-unhinted.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF-unhinted.zip"
  "MapleMonoNormalNL-NF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-NF.zip"
  "MapleMonoNormalNL-OTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-OTF.zip"
  "MapleMonoNormalNL-TTF-AutoHint.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-TTF-AutoHint.zip"
  "MapleMonoNormalNL-TTF.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-TTF.zip"
  "MapleMonoNormalNL-Variable.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-Variable.zip"
  "MapleMonoNormalNL-Woff2.zip::https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMonoNormalNL-Woff2.zip"
)
sha256sums=('9a4b302345b04f283e45628579bd8cfe691f2057353c8815cb64188ea422ba20'
            '4eb3b24241a26e9b53b57013fb6ebd5ef66c816bf7f67d633b9c889f635a6482'
            'dd9315012ff6728cb2d1c032e5efebdd71ca493b1f1b13a7f7b8d541fedbfd66'
            '66abbe15fb899ad1609709bb930519f2d47cc4cbddd6469c7a92b52a4083d562'
            '196e23519d39054231975eb852ee1bda0b0008fe8cc9f7a1ae043c25ae7bfc72'
            'fad02995d2241b6b3e206ec43a9fc3aac46a7125edbba1f44a2ba83ba1ff13a2'
            '95e84ef2894b5dbc03ffa4d3b89c38cf557665041a214d328252f4e9ae1fa008'
            'fb93ab2a57ed81ad205b24cd6795bbf42aa476f64d7eb33df7546e5b2312ab79'
            '65fc829bad9d7e82e2730c5482f6e060189bbe686d2094e494ad73bbb2ba89eb'
            'a09767a53dc7bb2a6d883d8fe099b62a3ddc87c3eafdaa16e737efb636752da7'
            '8a87aaacdb9dd2fdffc603fbc26c9cc6eb3b09caac3c36fc34cc980824228769')
noextract=(
  "MapleMonoNormalNL-CN-unhinted.zip"
  "MapleMonoNormalNL-CN.zip"
  "MapleMonoNormalNL-NF-CN-unhinted.zip"
  "MapleMonoNormalNL-NF-CN.zip"
  "MapleMonoNormalNL-NF-unhinted.zip"
  "MapleMonoNormalNL-NF.zip"
  "MapleMonoNormalNL-OTF.zip"
  "MapleMonoNormalNL-TTF-AutoHint.zip"
  "MapleMonoNormalNL-TTF.zip"
  "MapleMonoNormalNL-Variable.zip"
  "MapleMonoNormalNL-Woff2.zip"
)
package_maplemononormalnl-cn-unhinted() {
  unzip "MapleMonoNormalNL-CN-unhinted.zip" -d MapleMonoNormalNL-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN-unhinted" MapleMonoNormalNL-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN-unhinted" MapleMonoNormalNL-CN-unhinted/LICENSE.txt
}
package_maplemononormalnl-cn() {
  unzip "MapleMonoNormalNL-CN.zip" -d MapleMonoNormalNL-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-CN" MapleMonoNormalNL-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-CN" MapleMonoNormalNL-CN/LICENSE.txt
}
package_maplemononormalnl-nf-cn-unhinted() {
  unzip "MapleMonoNormalNL-NF-CN-unhinted.zip" -d MapleMonoNormalNL-NF-CN-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN-unhinted" MapleMonoNormalNL-NF-CN-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN-unhinted" MapleMonoNormalNL-NF-CN-unhinted/LICENSE.txt
}
package_maplemononormalnl-nf-cn() {
  unzip "MapleMonoNormalNL-NF-CN.zip" -d MapleMonoNormalNL-NF-CN
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-CN" MapleMonoNormalNL-NF-CN/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-CN" MapleMonoNormalNL-NF-CN/LICENSE.txt
}
package_maplemononormalnl-nf-unhinted() {
  unzip "MapleMonoNormalNL-NF-unhinted.zip" -d MapleMonoNormalNL-NF-unhinted
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-unhinted"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-unhinted"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF-unhinted" MapleMonoNormalNL-NF-unhinted/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF-unhinted" MapleMonoNormalNL-NF-unhinted/LICENSE.txt
}
package_maplemononormalnl-nf() {
  unzip "MapleMonoNormalNL-NF.zip" -d MapleMonoNormalNL-NF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-NF" MapleMonoNormalNL-NF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-NF" MapleMonoNormalNL-NF/LICENSE.txt
}
package_maplemononormalnl-otf() {
  unzip "MapleMonoNormalNL-OTF.zip" -d MapleMonoNormalNL-OTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-OTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-OTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-OTF" MapleMonoNormalNL-OTF/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-OTF" MapleMonoNormalNL-OTF/LICENSE.txt
}
package_maplemononormalnl-ttf-autohint() {
  unzip "MapleMonoNormalNL-TTF-AutoHint.zip" -d MapleMonoNormalNL-TTF-AutoHint
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF-AutoHint"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF-AutoHint"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF-AutoHint" MapleMonoNormalNL-TTF-AutoHint/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF-AutoHint" MapleMonoNormalNL-TTF-AutoHint/LICENSE.txt
}
package_maplemononormalnl-ttf() {
  unzip "MapleMonoNormalNL-TTF.zip" -d MapleMonoNormalNL-TTF
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-TTF" MapleMonoNormalNL-TTF/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-TTF" MapleMonoNormalNL-TTF/LICENSE.txt
}
package_maplemononormalnl-variable() {
  unzip "MapleMonoNormalNL-Variable.zip" -d MapleMonoNormalNL-Variable
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Variable"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Variable"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Variable" MapleMonoNormalNL-Variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Variable" MapleMonoNormalNL-Variable/LICENSE.txt
}
package_maplemononormalnl-woff2() {
  unzip "MapleMonoNormalNL-Woff2.zip" -d MapleMonoNormalNL-Woff2
  install -d "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Woff2"
  install -d "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Woff2"
  install -Dm644 -t "$pkgdir/usr/share/fonts/MapleMonoNormalNL-Woff2" MapleMonoNormalNL-Woff2/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/licenses/MapleMonoNormalNL-Woff2" MapleMonoNormalNL-Woff2/LICENSE.txt
}
