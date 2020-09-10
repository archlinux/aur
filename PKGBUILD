# Maintainer: Cerebrux <mail@cerebrux.net>
pkgname=shelldio
pkgver=1.2
pkgrel=1
pkgdesc="KISS Shell Radio for your terminal"
arch=( 'any' )
url="https://github.com/CerebruxCode/Shelldio"
license=('GPL3')
depends=( 'mpv' )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CerebruxCode/shelldio/archive/v${pkgver}.tar.gz")

package() {
	cd "$pkgname-$pkgver"
  cp -r .shelldio "/home/$USER/.shelldio"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 shelldio.sh "$pkgdir/usr/bin/shelldio"
}
md5sums=('4a161cd52f939129b2877463da2743cf')
