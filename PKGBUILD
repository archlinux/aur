# Maintainer: mirdukkkkk <contact@mirdukkkkk.space>

pkgname=beefetch
pkgver=1.1.3
pkgrel=1
pkgdesc="Neofetch clone written in bash with the ability to display 🐝"
arch=('any')
depends=('bash')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/mirdukkkkk/$pkgname/$pkgver/$pkgname")
sha512sums=('27ff50d732c8be4d0b3150eed04902e447228f55fb1b7816777684fa87282d6962678b8de52a3a5e301c05c5004299885ea29b848c03bffe8584ef09197404d0')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

package_debug() {
    return 1
}
