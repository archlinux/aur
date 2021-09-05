# Maintainer: Anufriev Roman <anufriev.roman@protonmail.com>
pkgname=calcure
pkgver=1.2
pkgrel=1
pkgdesc="Minimalist TUI calendar and task manager"
arch=('x86_64')
url="https://github.com/anufrievroman/calcure"
license=('GPL')
depends=('python')
makedepends=('git')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
md5sums=('b946aa9390e37e673183f93df9ed8513')


package() {
    cd "$pkgname-$pkgver"
    install -Dm755 calcure "$pkgdir/usr/bin/calcure"
    install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname"
}
