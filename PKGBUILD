# Maintainer: Tianchuan Lin <lintianchuan24@gmail.com>
pkgname=ttf-google-sans-code-vf
pkgver=6.000
pkgrel=1
pkgdesc="Google Sans Code font family (Variable weight, TTF)"
arch=('any')
url="https://github.com/googlefonts/googlesans-code"
license=('OFL')
depends=('fontconfig')
source=("GoogleSansCode-v${pkgver}.zip::https://github.com/googlefonts/googlesans-code/releases/download/v${pkgver}/GoogleSansCode-v${pkgver}.zip")
sha256sums=('54c2b5bbb68159838106e7d1cffb2e8ceb8f7b46b93f730603b36519a6125bbb')

package() {
  cd "$srcdir"
  
  # Install variable fonts
  install -Dm644 variable/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  
  # Install license
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
