# Maintainer: Aoibhinn Nic Aoidh <oibind@pm.me>

_pkgname=obsh
pkgname=${_pkgname}-git
pkgver=20190612
pkgrel=1
pkgdesc="A tiny bash script for finding SSH servers in your local network."
url="https://github.com/notthebee/obsh/blob/master/obsh"
arch=('any')
provides=('obsh')
depends=('nmap')
makedepends=('git')
source=(git+https://github.com/notthebee/${_pkgname}.git)
md5sums=('SKIP')


package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
