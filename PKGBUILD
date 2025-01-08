# Maintainer: mirdukkkkk <contact@mirdukkkkk.space>

pkgname=beefetch
pkgver=1.1.2
pkgrel=1
pkgdesc="Neofetch clone written in bash with the ability to display 🐝"
arch=('any')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL-3.0-only')
source=("https://raw.githubusercontent.com/mirdukkkkk/$pkgname/$pkgver/$pkgname")
sha512sums=('02b5d9a6206b0b6d23a5aaee103fd815232d9bc0c4e86a73dcdcc6a7421c35ee6feda5cffd6ab78670b7942bf83f44f3e4ea62a69618f52062993b6ef3277aa7')

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_debug() {
    return 1
}
