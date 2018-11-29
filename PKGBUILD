# Maintainer: tembleking <tembleking at gmail dot com>

pkgname=openmarkov
pkgver=0.2.0
pkgrel=1
pkgdesc="Open source tool designed to compute Probabilistic Graphical Models."
arch=('i686' 'x86_64')
url="http://www.openmarkov.org"
license=('EULP')
noextract=("$pkgname.jar")
depends=('java-environment')
source=("$pkgname.jar::http://www.openmarkov.org/$pkgname-$pkgver.jar"
        "$pkgname.sh"
)
md5sums=('60336ad11f8e1c1423606c277b2c789d'
         '1f295616d246e47aa34e518ff5de07c2')

package() {
    cd $srcdir
    install -Dm644 $pkgname.jar $pkgdir/opt/openmarkov/openmarkov.jar
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/openmarkov
}
