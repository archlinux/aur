# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=defrag
pkgver=0.08
pkgrel=1
pkgdesc="A braindead simple and filesystem agnostic defrag script"
url="http://ck.kolivas.org/apps/defrag/"
license=()
depends=('bash')
arch=('i686' 'x86_64')
source=(http://ck.kolivas.org/apps/defrag/$pkgname-$pkgver/defrag)
md5sums=('cdc2179f521689356834efaedad15a62')

build() {
    cd $srcdir

    install -D -m755 defrag $pkgdir/usr/bin/defrag
}
