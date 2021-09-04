# Maintainer: Anufriev Roman <anufriev.roman@protonmail.com>
pkgname=calcure-git
pkgver=1
pkgrel=1
pkgdesc="Minimalist TUI calendar"
arch=('x86_64')
url="https://github.com/anufrievroman/calcure"
license=('GPL')
depends=('python')
makedepends=('git')
source=('calcure::git://github.com/anufrievroman/calcure.git')
md5sums=('SKIP')


package() {
    cd "$pkgname"
    install -Dm755 calcure "$pkgdir/usr/bin/calcure"
    install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname"
}
