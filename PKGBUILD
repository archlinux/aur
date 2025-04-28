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
pkgver="7.1"
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
sha256sums=('078bf69497927abcd7dcd45b7da940436cdf35026d9307ceddf56facbe720168'
            '301b573410f35ba5a880d0af18c573ce027954fba960e3cf23f7fc382faa534c'
            '6bfad6e6c534da704cc744ae49f2193e7477ee0f56cf3052bfd278ea48afe317'
            'a7598520c953e09126c721821b6e16f1209d8bee1dd52f50c87174f60de20e76'
            'd6c9fbc2dd6cef5b741785bc7d449ba8e89eef55787098ac06ba4573beecd232'
            'ce82d8fdf8fb931920d34e342b4510c6189e89c3397a8f562d2f960405d9af98'
            '39d698a119decb81b076c42faee47e8e3f3cf4b07005653d16d4cd251f69207a'
            '6f1ec576f8033e9415f301a9583fb7c331044d22f71e062733c51b9a848949ce'
            '1542eef0b6855be45c5223b91d58f67b8be17dca6182f9b2453fe2434ff141cf'
            '8c290de10821995972b853b579e2fdbd2d1334d545369f6e4348b6dba48d4ed8'
            '100a58fea7a844c3ac7aaa96cf9dadc9249093e05467bd6269f134dc319f43f4')
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
