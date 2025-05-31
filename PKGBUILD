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
pkgver="7.3"
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
sha256sums=('9cb0fd29a273decaa13736a4251b66d4579368c3e9f9cd750a4fd6dd602cb657'
            'ca73eb68318ad9732bc3913d5f54a3243c624f2d1ba93173239050f6518cfbb5'
            '4969e96961717e92ff82d721b609b7a9ae8386889bc95c2b6e94c8ff0bda6a43'
            '4aaf51a5754aac105d20dc7a31c9c8f96f6abaf346ce1e5c1a5763c4067a0950'
            'bf5ca3b30f2f9265fa36ea068dd85ec595bdbd51b05c8b57ca7e4384be1c6161'
            '8ac1d991174f90c79f9a76944f68e94a6a055b8d3b17be29129318f41b916f6c'
            '2cd9196b97266158fd5d0c2d3bb3f21ac713cebefe11aedb02ea151c032292fc'
            '01cae38e67216345c217f863ba458c0de8b64f958b564359f1493e7f3b367da6'
            '449a80a8d7192831705ba5e743175b0fe30fe8bfad9756f6d4dd69f72a6b7dfe'
            '161b92975050abcf973f93a3657a3c8cef6de06ebf4621ebe9a8e97157d566c7'
            '5aee26baa644379e1d72f1f593d31e6f38b7fad3b049d0778fe903596e13719c')
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
