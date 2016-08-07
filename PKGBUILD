# Contributor: alterkacker, graysky

pkgname=cacheclean
pkgver=2.1
pkgrel=6
pkgdesc='Cleans up pacman packages from cache. Users selects how many old versions to keep.'
arch=(any)
license=('GPLv3')
depends=('python')
source=("https://raw.githubusercontent.com/goetzc/$pkgname/master/src/$pkgname")
md5sums=('b71d8a611f19ef4ed8ce7914a9d1e36c')
url=https://bbs.archlinux.org/viewtopic.php?id=9104

package() {
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
