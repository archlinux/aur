# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=defrag
pkgver=0.06
pkgrel=1
pkgdesc="A braindead simple and filesystem agnostic defrag script"
url="http://ck.kolivas.org/apps/defrag/"
license=""
depends=('bash')
arch=('i686' 'x86_64')
source=(http://ck.kolivas.org/apps/defrag/$pkgname-$pkgver/defrag)
md5sums=('01baf6626ea026e7750aa621c13cbd58')

build() {
    cd $startdir/src/

    install -D -m755 defrag $startdir/pkg/usr/bin/defrag
}
