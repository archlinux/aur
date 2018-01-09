pkgname=lua-mosquitto
pkgver=20171109
pkgrel=1
pkgdesc="libmosquitto lua binding"
url="http://mosquitto.org/"
depends=('lua' )
license=('MIT')
arch=('any')
source=('git+https://github.com/flukso/lua-mosquitto.git')
md5sums=('SKIP')
gpgchecksums=('SKIP')

build() {
    cd $srcdir/$pkgname
    make
    # make LUAPKG=lua5.1
}

package() {
    cd $srcdir/$pkgname
    make DESTDIR="$pkgdir/" install
}
