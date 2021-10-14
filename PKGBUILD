pkgname=1337
pkgver=1.1
pkgrel=0
pkgdesc="c0nv3r7 n0rm41 73x7 in70 1337"
arch=("any")
url="https://code.obermui.de/6543/1337"
license=('GPL3+')
depends=('bash')
source=("https://code.obermui.de/6543/1337/raw/tag/v1.1/1337")
sha1sums=('d10d82a467cfd64c48db4b93980a472695bdabb7')

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./1337 $pkgdir/usr/bin/$pkgname
}
