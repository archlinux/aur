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
pkgver="7.2"
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
sha256sums=('05144849f036d4442f3549421b0362541919a43005fa2095f7d2ec609b2ebfd4'
            '4971b69e5069cae88530b502972979673a0fc55179c37dc98c2682e6d3c6ffcb'
            'd0467397609d76a876b4bb1f0dde553612707ae79924afca6aa3bd5549062c89'
            'fe7421b1fec0ca827ec6452e8d8f33e69ff15b23cb44e206b6949080cbe69587'
            'd8b96b11823dd861d12022df61b525f54f846dd01b0a38994970fbcf9bd10b8c'
            '509017143e0a566f256d9ccf31a130ac7d1d8af45fec7c62c43c6eacf1a4538e'
            'f7c3463fb6abbf0d56d9a90d5b078a2be39f5b5e15b5b17f7f2f289515dc00f0'
            '8fd986dd53380cff36ca7c34505b8c0d78dc6cc9ee54a39f27d1cc045aebbc39'
            '984249ff2e5a9a1301b7e32ba1250cb9a4ea1a0dcb51e6138809ffbc031fcb95'
            '2f05bde082407dd96d1b6c26262bfa26607c7cd75d75bfffc87b19bccbe5493a'
            '1ee1dc35e0b0fc012c49c2867224cae4ee51cfb7824b4865cdfcf965872a2f25')
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
