# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=auh
pkgver=0.0.3
pkgrel=1
pkgdesc="AUR helper written in Bash"
arch=("any")
url="https://git.sr.ht/~nicknb/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("jq" "git" "curl" "pacman" "sudo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('76421b1dce46ef9ba5083256a6126b13e3739dedd194aa35a674115c2e46f74f')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
