# Maintainer: mirdukkkkk <contact@mirdukkkkk.space>

pkgname=beefetch
pkgver=1.1.0
pkgrel=1
pkgdesc="Neofetch clone written in bash with the ability to display 🐝"
arch=('any')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL3')
source=("https://raw.githubusercontent.com/mirdukkkkk/$pkgname/$pkgver/$pkgname")
sha512sums=('5bfc870e5148b0531d9928fc40ab6a0dcab40bc818776616a77aa1855cfc959c65d2bde25dbd8558482326248c2d6a367adb3e34bc257b7500f4f491e6a0143a')

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_debug() {
    return 1
}
