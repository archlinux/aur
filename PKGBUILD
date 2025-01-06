# Maintainer: mirdukkkkk <contact@mirdukkkkk.space>

pkgname=beefetch
pkgver=1.1.1
pkgrel=1
pkgdesc="Neofetch clone written in bash with the ability to display 🐝"
arch=('any')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL-3.0-only')
source=("https://raw.githubusercontent.com/mirdukkkkk/$pkgname/$pkgver/$pkgname")
sha512sums=('29181ec364507de6057b043ca46c7a9738e9c7a8c4749514415b3e5c1a50676ab71f6b4ac4b8b2edcbf41b72219b18957776623b49374b3d03730a2014d76cae')

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_debug() {
    return 1
}
