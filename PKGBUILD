# Maintainer: RiddlerXenon riddler.xenon@gmail.com
pkgname=ddh
pkgver=1.0.4
pkgrel=1
pkgdesc="Dynamic Display Handler"
arch=('any')
url="https://github.com/RiddlerXenon/DynamicDisplayHandler"
license=('GPL')
depends=('xorg-server' 'systemd' 'awk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('8a26564e369e98f3c7cdf64e311b28aa4f87c23634b03d54a2451aa3d0d137ab')
install=ddh.install

package() {
    cd "$srcdir/DynamicDisplayHandler-$pkgver"

    install -Dm755 ddh.sh "$pkgdir/usr/local/bin/ddh.sh"
    install -Dm755 aur_install.sh "$pkgdir/usr/local/bin/install-ddh.sh"
}

