# Maintainer: Mohammad K. Hussain <hussainmohammad328@gmail.com>

pkgname=saveland
pkgver=0.1.0
pkgrel=1
pkgdesc="Save and restore window layouts in Hyprland"
arch=('any')
url="https://github.com/MAX-786/saveland"
license=('MIT')
depends=('bash' 'jq')
optdepends=('wmctrl: For GNOME support'
            'xdotool: For GNOME support')
provides=('saveland')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MAX-786/$pkgname/archive/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  
  # Install the main executable
  install -Dm755 saveland "$pkgdir/usr/bin/saveland"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('1d4be6ff0ffff91c5897f12424dd212085d3a2a3db0a4221acf0e237b66681c9')