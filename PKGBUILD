# Maintainer: eldiaboloz <iliyan87.ivanov@gmail.com>
pkgname=totp-cli-rofi
pkgver=1.1.4
pkgrel=1
pkgdesc="Simple CLI TOTP tool with rofi integration"
arch=('any')
depends=('fzf' 'rofi' 'jq' 'gnupg' 'oath-toolkit' 'xdotool' 'bash')
optdepends=('ydotool: wayland')
license=('MIT')
url="https://github.com/eldiaboloz/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eldiaboloz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3029fda274751cb2e0e6f8ac19def01966ab77356dae77d4393027ac2df68f9f')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 444 -D LICENCE "$pkgdir/usr/share/doc/$pkgname/LICENCE"
}
