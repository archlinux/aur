pkgname=ramme
pkgver=2.3.0
pkgrel=1
pkgdesc="Unofficial Instagram Desktop App"
arch=('x86_64')
url="https://github.com/terkelg/ramme/"
license=('MIT')
depends=('electron')
options=('!docs' '!emptydirs')
source=("https://github.com/terkelg/ramme/releases/download/2.3.0/Ramme-linux-2.3.0.zip" "ramme.desktop")
md5sums=('55ce27dbea407e0270781a60348ba34c' 'f02bbf5ad28e32c46b9ad7b7c217ecbc')
package() {
  mkdir $pkgdir/opt/
  mkdir $pkgdir/opt/ramme
  unzip Ramme-linux-2.3.0.zip -d "$pkgdir/opt/ramme"

  # Link to the binary
  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/share/
  mkdir $pkgdir/usr/share/applications/
  cp ramme.desktop $pkgdir/usr/share/applications/
}
