# Maintainer: RiddlerXenon riddler.xenon@gmail.com
pkgname=ddh
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic Display Handler"
arch=('any')
url="https://github.com/RiddlerXenon/DynamicDisplayHandler"
license=('GPL')
depends=('xorg-server' 'systemd' 'awk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('cefab1ae6feeccd832186a4f172c29eaa41a81f4fc0d25d2c985c9b5cdc5a914')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 install.sh "$pkgdir/usr/bin/ddh-install"
}
