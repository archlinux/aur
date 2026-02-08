pkgname=yauri
pkgver=$(python3 ./yauri -v)
pkgrel=1
pkgdesc="yauri, the gayest aur helper ever, all fitting into 1 file."
arch=('any')
license=('GPL')
md5sums=()
depends=('python3' 'python-requests' 'pacman-contrib' 'git' 'python-colorama')

package() {
    install -Dm755 ./../yauri "$pkgdir/usr/bin/yauri" ;
}