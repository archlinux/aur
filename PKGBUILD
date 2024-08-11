# Maintainer: eldiaboloz <iliyan87.ivanov@gmail.com>
pkgname=totp-cli-rofi
pkgver=1.1.1
pkgrel=1
pkgdesc="Simple CLI TOTP tool with rofi integration"
arch=('any')
depends=('fzf' 'rofi' 'jq' 'gnupg' 'oath-toolkit' 'xdotool' 'bash')
license=('MIT')
url="https://github.com/eldiaboloz/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eldiaboloz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c73dff089d47e02ce3a99a7211bd5b0d220186d6edcb089e03a1ccfaa69999de')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 444 -D LICENCE "$pkgdir/usr/share/doc/LICENCE"
}
