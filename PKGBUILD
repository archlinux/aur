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
pkgver="7.4"
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
sha256sums=('84d25f86c6b1467cefff763c1b369fe729bd5f10c4c953ab2d1dc4f45a4597cb'
            '4a84b9d8bd3da36a99972285b9104ee45e0f297045005c48eb1a5ce047f55c77'
            'bdb58819097983f38a145d142b79b6454677d1bbb71ff6edcd77b431b264e480'
            '6dc1fd2cc2cc68a27903ef7df78caf6cca14360cf8def4140d3b36d3461e1e7e'
            'c96d7945fec613c432e587bd40604c2e66be2b1d8a8fede5fd2000ce904b83c9'
            '120de129c1e4b25b2f1b39090eb864c8dd08018ae31c9f9eaf3140540bbf2b48'
            '3d5b182ff31d0fb697dcfe6461a7daff1c11f38076b86e53ccc7e2ee2d513963'
            'bed107281bf482323a22ecd706665c515252e9f3cd1ff1c9aa8855641c173745'
            '62450d979f679654d071ad43ba3f6986edb4acb3224d299c097734465b8a967e'
            '8b4b2522b054c005d98fa55550152c13237e9b24a020125c0392cbee205a9810'
            '538c383ea47c602d07a2d0ecfeb1ee5127f6f1606728d9d51def05b4ef0c0870')
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
