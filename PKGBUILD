# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=auh
pkgver=0.0.2
pkgrel=2
pkgdesc="AUR helper written in Bash"
arch=("any")
url="https://git.sr.ht/~nicknb/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("jq" "git" "curl" "pacman" "sudo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('62b35558566060eec5a7bad175bbf352bd8de3387178faa5d189bf373190c002')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
