# Maintainer: Tianchuan Lin <lintianchuan24@gmail.com>
pkgname=ttf-google-sans-code-vf
pkgver=7.000
pkgrel=1
pkgdesc="Google Sans Code font family (Variable weight, TTF)"
arch=('any')
url="https://github.com/googlefonts/googlesans-code"
license=('OFL')
depends=('fontconfig')
source=("GoogleSansCode-v${pkgver}.zip::https://github.com/googlefonts/googlesans-code/releases/download/v${pkgver}/GoogleSansCode-v${pkgver}.zip")
sha256sums=('5bd294283cb93172598b7fa4f62855c63c79f55b803e75d738777f093b73c586')

package() {
  cd "$srcdir"
  
  # Install variable fonts
  install -Dm644 ./*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  
  # Install license
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
