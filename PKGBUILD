# Maintainer: Julien Deswaef <juego@requiem4tv.com>

pkgbase=fork-awesome
pkgname=(ttf-fork-awesome)
pkgver=1.1.3
pkgrel=1
pkgdesc="A fork of the iconic font and CSS toolkit"
url="https://forkawesome.github.io"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/ForkAwesome/Fork-Awesome/archive/$pkgver.tar.gz")
sha256sums=('0959b252c8aa6d7741789b92f5906073c857256bc949b0c68b622c11c05d0053')

package_ttf-font-awesome-4() {
  install -Dm644 OFL "$pkgdir/usr/share/licenses/$pkgname/OFL"
  cd "Fork-Awesome-$pkgver/fonts"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
