# Maintainer: RiddlerXenon riddler.xenon@gmail.com
pkgname=ddh
pkgver=1.0.3
pkgrel=1
pkgdesc="Dynamic Display Handler"
arch=('any')
url="https://github.com/RiddlerXenon/DynamicDisplayHandler"
license=('GPL')
depends=('xorg-server' 'systemd' 'awk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('412cb6d34e46ca30fbe03a52f38886717fa7b9ecb7dc7d1940062d55de902542')
install=ddh.install

package() {
    cd "$srcdir/DynamicDisplayHandler-$pkgver"

    install -Dm755 ddh.sh "$pkgdir/usr/local/bin/ddh.sh"
    install -Dm755 aur_install.sh "$pkgdir/usr/local/bin/install-ddh.sh"
}

