# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=ttf-lxgw-neo-xihei-code
pkgver=1.302
pkgrel=1
pkgdesc='A monospaced CJK font merged from LXGW NeoXiHei and legacy M+ for programming use.'
arch=('any')
url='https://github.com/lxgw/NeoXiHei-Code'
license=('IPA')
source=("$pkgname-$pkgver.ttf::$url/raw/v$pkgver/NeoXiHeiCode-Regular.ttf"
        "IPA_Font_License_Agreement_v1.0-$pkgver.txt::$url/raw/v$pkgver/IPA_Font_License_Agreement_v1.0.txt")
sha256sums=('874be6c480ab30eff87ee1f4284fe4ae811218977188538439657f51081f54c0'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package() {
  install -Dm644 "$pkgname-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/NeoXiHeiCode-Regular.ttf"
  install -Dm644 "IPA_Font_License_Agreement_v1.0-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
