# Maintainer: eldiaboloz <iliyan87.ivanov@gmail.com>
pkgname=totp-cli-rofi
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple CLI TOTP tool with rofi integration"
arch=('any')
depends=('fzf' 'rofi' 'jq' 'gnupg' 'oath-toolkit' 'xdotool' 'bash')
license=('MIT')
url="https://github.com/eldiaboloz/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eldiaboloz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a157f978ebe5cc76f1b336ed6f353957c3ba2988fe4237efa1f2be0030cc8bf2')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 444 -D LICENCE "$pkgdir/usr/share/doc/LICENCE"
}
