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
sha256sums=('336259b5e7b8637bdd81dfe06cac982326b15f015feb21ad5d0da6247790f44a')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 install.sh "$pkgdir/usr/bin/ddh-install"
}
