# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=auh
pkgver=0.0.4
pkgrel=1
pkgdesc="AUR helper written in Bash"
arch=("any")
url="https://git.sr.ht/~nicknb/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("jq" "git" "curl" "pacman" "sudo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2aac7d98ea22a5ca22d2f7ea299857e23bbd39f1ab39ff67570d97a30acb888a')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
