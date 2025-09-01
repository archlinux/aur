# Maintainer: Tianchuan Lin <lintianchuan24@gmail.com>
pkgname=ttf-google-sans-code-vf
pkgver=6.001
pkgrel=1
pkgdesc="Google Sans Code font family (Variable weight, TTF)"
arch=('any')
url="https://github.com/googlefonts/googlesans-code"
license=('OFL')
depends=('fontconfig')
source=("GoogleSansCode-v${pkgver}.zip::https://github.com/googlefonts/googlesans-code/releases/download/v${pkgver}/GoogleSansCode-v${pkgver}.zip")
sha256sums=('7c530a2d30d0a56e716102031d2b0691f9369c4ee1ea26f71982cfadbf376030')

package() {
  cd "$srcdir"
  
  # Install variable fonts
  install -Dm644 variable/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  
  # Install license
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
