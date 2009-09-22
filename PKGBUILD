# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=defrag
pkgver=0.07
pkgrel=1
pkgdesc="A braindead simple and filesystem agnostic defrag script"
url="http://ck.kolivas.org/apps/defrag/"
license=""
depends=('bash')
arch=('i686' 'x86_64')
source=(http://ck.kolivas.org/apps/defrag/$pkgname-$pkgver/defrag)
md5sums=('3a0c4c1278cebe9ddf7741a0c7c6e743')

build() {
    cd $startdir/src/

    install -D -m755 defrag $startdir/pkg/usr/bin/defrag
}
