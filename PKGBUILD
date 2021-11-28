# Maintainer: Senderman <doletov.fyodor@yandex.ru>

pkgname=zram-openrc
pkgdesc="Activate zram using openrc"
pkgver=1.0
pkgrel=2
arch=('any')
provides=('init-zram')
conflicts=('init-zram')
url="https://aur.archlinux.org/$pkgname"
depends=('openrc')
license=('GPL2')
source=('zram.init' 'zram.conf')
md5sums=('b5967b1ede20310750e7e0ed62d2b5c2'
         '1b48c7cf1f25478ec85cef7393170f99')


package() {
    install -Dm0755 $srcdir/zram.init $pkgdir/etc/init.d/zram
    install -Dm0755 $srcdir/zram.conf $pkgdir/etc/conf.d/zram
}
