# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=auh
pkgver=0.0.1
pkgrel=1
pkgdesc="AUR helper written in Bash"
arch=("any")
url="https://git.sr.ht/~nicknb/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("jq" "git" "curl" "pacman" "sudo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('54adb1d3a75fc8fe4cc620ca16379e3141cd7232a00340cf67f609ba2b5b34a7')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
