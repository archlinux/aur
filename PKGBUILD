pkgname=ttf-noto-sans-egyptian-hieroglyphs
pkgver=0
pkgrel=0
pkgdesc=""
arch=('any')
url='https://github.com/notofonts/egyptian-hieroglyphs'
license=('OFL-1.1')
source=('https://notofonts.github.io/egyptian-hieroglyphs/fonts/NotoSansEgyptianHieroglyphs/hinted/ttf/NotoSansEgyptianHieroglyphs-Regular.ttf')
# source=('https://github.com/notofonts/egyptian-hieroglyphs/releases/download/NotoSansEgyptianHieroglyphs-v2.002/NotoSansEgyptianHieroglyphs-v2.002.zip')
# source=("$_pkgname::git+$url.git")
md5sums=(e4bd80d8e6a3b0891f389212a8938bc8)

package() {
  install -m644 -Dt "$pkgdir/usr/share/fonts/TTF/" 'NotoSansEgyptianHieroglyphs-Regular.ttf'
}
