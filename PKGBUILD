# Maintainer: Andrew Hills <ahills@ednos.net>

pkgname=suspend-hacks
pkgver=0
pkgrel=1
pkgdesc='Hacks to restart services on suspend'
arch=('any')
license=('Public Domain')
depends=('coreutils' 'systemd')
url=
backup=('etc/conf.d/suspend-hacks')
source=(suspend-hacks.sh
        suspend-hacks.conf)
md5sums=('f2c3cb3dc9e474667832ecefb1064575'
         'b74ce1b49b9b1e919d5fc0b181a16ac8')

package() {
	install -Dm755 $srcdir/suspend-hacks.sh $pkgdir/usr/lib/systemd/system-sleep/suspend-hacks.sh
	install -Dm644 $srcdir/suspend-hacks.conf $pkgdir/etc/conf.d/suspend-hacks
}
