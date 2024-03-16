# Maintainer: RiddlerXenon riddler.xenon@gmail.com
pkgname=ddh
pkgver=1.0.2
pkgrel=1
pkgdesc="Dynamic Display Handler"
arch=('any')
url="https://github.com/RiddlerXenon/DynamicDisplayHandler"
license=('GPL')
depends=('xorg-server' 'systemd' 'awk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('2ad6a89b90cc92378aa1ec612e8d573babc0902edab2d2423b3abb704f85fd56')
install=ddh.install

package() {
    cd "$srcdir/DynamicDisplayHandler-$pkgver"

    install -Dm755 ddh.sh "$pkgdir/usr/local/bin/ddh.sh"
    install -Dm755 aur_install.sh "$pkgdir/usr/local/bin/install-ddh.sh"
}

