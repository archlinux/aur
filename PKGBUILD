# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=alsa-switch
pkgver=1.0.0
pkgrel=1
pkgdesc="Rofi menu that rewrites ~/.asoundrc to set the default ALSA input/output device"
arch=('any')
url="https://github.com/pakhromov/alsa-switch"
license=('MIT')
depends=('bash' 'alsa-utils' 'rofi' 'gawk')
optdepends=('ttf-nerd-fonts-symbols: icons in the menu')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0d798d93f7f0e5e0db75a3aabcc1e9cdd48df33b6539db1cfc3e530fbc8819d')

package() {
      cd "$pkgname-$pkgver"
      install -Dm755 alsa-switch "$pkgdir/usr/bin/alsa-switch"
      install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
