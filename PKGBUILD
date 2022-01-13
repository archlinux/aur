# Maintainer: Anufriev Roman <anufriev.roman@protonmail.com>
pkgname=calcure
pkgver=1.6
pkgrel=1
pkgdesc="Modern TUI calendar and task manager"
arch=('x86_64')
url="https://github.com/anufrievroman/calcure"
license=('GPL')
depends=('python')
makedepends=('git')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
md5sums=('1bc19e6b9ce928ecfedd73aa884682d6')


package() {
    cd "$pkgname-$pkgver"
    install -Dm755 calcure "$pkgdir/usr/bin/calcure"
    install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname"
}
