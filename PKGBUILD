# Maintainer: mirdukkkkk <contact@mirdukkkkk.space>

pkgname=beefetch
pkgver=1.1.4
pkgrel=1
pkgdesc="Neofetch clone written in bash with the ability to display 🐝"
arch=('any')
depends=('bash')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/mirdukkkkk/$pkgname/$pkgver/$pkgname")
sha512sums=('4d5ebfefe410cdd4d7bac89fea0c7969f915260e419c3c44901311fd40cd2a62d38252d3a5dd6e44583cbc0deca7fb3ca8162093fd2ab0e25c16187b0dd881e5')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

package_debug() {
    return 1
}
