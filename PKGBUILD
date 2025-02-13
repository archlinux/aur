# Maintainer: eldiaboloz <iliyan87.ivanov@gmail.com>
pkgname=totp-cli-rofi
pkgver=1.1.2
pkgrel=1
pkgdesc="Simple CLI TOTP tool with rofi integration"
arch=('any')
depends=('fzf' 'rofi' 'jq' 'gnupg' 'oath-toolkit' 'xdotool' 'bash')
license=('MIT')
url="https://github.com/eldiaboloz/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eldiaboloz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1e8b4e8666c20f73eabb3433fb00d579e3d3ba6d636b5a84291a925c54b0ec1e')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 444 -D LICENCE "$pkgdir/usr/share/doc/$pkgname/LICENCE"
}
