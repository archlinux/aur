pkgname=1337
pkgver=1.0
pkgrel=1
pkgdesc="c0nv3r7 n0rm41 73x7 in70 1337"
arch=("any")
url="https://code.obermui.de/6543/1337"
license=('GPL3+')
depends=('bash')
source=("https://code.obermui.de/6543/1337/raw/branch/master/1337")
sha1sums=('ac86d02ffcea1bc65922cf2b3150226d5216f0ac')

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./1337 $pkgdir/usr/bin/$pkgname
}
