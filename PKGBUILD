# Maintainer: Luís Ferreira <org dot aurorafoss at luis, backwards>
# Contributor: Carlo Capocasa <carlo@capocasa.net>

pkgname=i3-battery-popup
pkgver=1.0.0
pkgrel=1
pkgdesc="A script that shows messages to the user when the battery is almost empty."
arch=(any)
url="https://github.com/rjekker/i3-battery-popup"
license=('GPL')
provides=('i3-battery-popup-git')
conflicts=('i3-battery-popup-git')
depends=('bash')
optdepends=('tk: for tk dialogs support')
source=("$pkgname-$pkgver::https://github.com/rjekker/i3-battery-popup/archive/v$pkgver.tar.gz")
sha512sums=('638f701a152de6774c3ca6059ac326950d07f78fa5c40d1f0a2143d9e71f83164705155f3642b09ad22d6b828e05be2d372a2946e39404ea245145c11e950b63')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -Dm 755 i3-battery-popup "$pkgdir/usr/bin/i3-battery-popup"
}
